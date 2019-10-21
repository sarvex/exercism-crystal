require "../exercise_generator"
require "../test_cases"

class ProverbGenerator < ExerciseGenerator
  def exercise_name
    "proverb"
  end

  def test_cases
    TestCases(ProverbTestCase).from_json(data).cases
  end
end

class ProverbTestCase < ExerciseTestCase
  class Input
    JSON.mapping(
      strings: Array(String)
    )
  end

  JSON.mapping(
    description: String,
    property: String,
    input: Input,
    expected: Array(String)
  )

  def format_array(strings : Array(String)) : String
    if strings.empty?
      return "[] of String"
    else
      return "[#{strings.map { |h| "\"#{h}\"" }.join(",\n")}]"
    end
  end

  def workload
    <<-WL
    proverb = Proverb.#{property}(#{format_array(input.strings)})
        proverb.should eq(#{format_array(expected)})
    WL
  end

  def test_name
    description
  end
end
