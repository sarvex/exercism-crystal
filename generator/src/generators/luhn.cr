require "../exercise_generator"
require "../test_cases"

class LuhnGenerator < ExerciseGenerator
  def exercise_name
    "luhn"
  end

  def test_cases
    TestCases(LuhnTestCase).from_json(data).cases
  end
end

class LuhnTestCase < ExerciseTestCase
  class Input
    JSON.mapping(
      value: String
    )
  end

  JSON.mapping(
    description: String,
    property: String,
    input: Input,
    expected: Bool
  )

  def workload
    "Luhn.valid?(\"#{input.value}\").should eq(#{expected})"
  end

  def test_name
    description
  end
end
