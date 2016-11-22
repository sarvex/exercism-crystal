require "./exercise_generator"
require "./exercise_test_case"

class ForthGenerator < ExerciseGenerator
  def exercise_name
    "forth"
  end

  def test_cases
    test_cases = [] of JSON::Any
    JSON.parse(data).each do |k, v|
      v.each do |a, b|
        test_cases.concat(b) if a.as_s == "cases"
      end
    end
    test_cases.map do |test_case|
      ForthTestCase.new(test_case)
    end
  end
end

class ForthTestCase < ExerciseTestCase
  private getter input : JSON::Any
  private getter description : JSON::Any
  private getter expected : JSON::Any

  def initialize(test_case)
    @input = fix_empty_array(test_case["input"])
    @description = test_case["description"]
    @expected = fix_empty_array(test_case["expected"])
  end

  def workload
    if !(expected == nil)
      "Forth.evaluate(#{input}).should eq(#{expected})"
    else
      <<-WL
      expect_raises do
            Forth.evaluate(#{input})
          end
      WL
    end
  end

  def test_name
    description
  end

  private def fix_empty_array(json)
    if json.to_s.match(/\[\]/)
      json = "[] of String | Int32".to_json
      JSON.parse(json)
    else
      json
    end
  end
end
