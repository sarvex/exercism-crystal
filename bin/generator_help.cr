require "liquid"
require "json"
require "http/client"

class GeneratorHelp
  @tpl : String | Nil
  @json : JSON::Any

  def initialize(@exercise : String)
    check_config()
    @json = get_remote_files()
    @json.as_h["exercise_cammel"] = JSON::Any.new(to_cammel(@json["exercise"].to_s))
    p @json
    remove_tests(toml())
    template_path = "./exercises/practice/#{@exercise}/.meta/test_template.liquid"
    raise "Template not found: #{template_path}" unless File.exists?(template_path)
    template_file = File.read(template_path)
    ctx = Liquid::Context.new
    ctx.set "json", @json
    tpl = Liquid::Template.parse template_file
    @tpl = tpl.render ctx
  end

  def to_s
    @tpl
  end

  def toml()
    uuid = [] of String
    path = "./exercises/practice/#{@exercise}/.meta/tests.toml"
    raise "Toml not found: #{path}" unless File.exists?(path)
    File.read(path).split("\n").each do |line|
      line = line.strip
      if line.starts_with? "#"
        next
      elsif line.starts_with? "["
        uuid << line[1...-1]
      elsif line.gsub(" ", "") == "include=false"
        uuid.pop
      end
    end
    uuid
  end

  def remove_tests(uuid : Array(String))
    @json["cases"].as_a.reverse.each do |test|
      if !uuid.includes?(test["uuid"]?) && !test["uuid"]?.nil?
        @json["cases"].as_a.delete(test)
      elsif !test["cases"]?.nil?
        test["cases"].as_a.reverse.each do |subtest|
          if !uuid.includes?(subtest["uuid"]?) && !subtest["uuid"]?.nil?
            test["cases"].as_a.delete(subtest)
          end
        end
      end
    end
  end

  def get_remote_files()
    response = HTTP::Client.get("https://raw.githubusercontent.com/exercism/problem-specifications/main/exercises/#{@exercise}/canonical-data.json")
    case response.status_code
    when 200
      return JSON.parse(response.body)
    when 404
      raise "Couldn't find canonical data for #{@exercise} on the github repo: problem-specifications."
    else
      raise "Error while requesting the #{@exercise} data file from GitHub... " +
            "Status was #{response.status_code}"
    end
  end

  def check_config()
    config_file = File.read("./config.json")
    JSON.parse(config_file)["exercises"]["practice"].as_a.each do |x|
      return true if @exercise == x["slug"]
    end
    raise "Couldn't find the exercise in the config.json.\nMake sure you use the same slug name as in the config file."
  end

  def to_cammel(input : String)
    result = ""
    input = input.capitalize
    capitalized = false
    input.each_char do |x|
      if x == '-'
        capitalized = true
      else
        result += capitalized ? x.upcase : x
        capitalized = false
      end
    end
    result
  end
end
