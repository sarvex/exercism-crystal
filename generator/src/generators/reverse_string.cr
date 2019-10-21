require "../exercise_generator"
require "../test_cases"

class ReverseStringGenerator < ExerciseGenerator
  def exercise_name
    "reverse-string"
  end

  def test_cases
    TestCases(ReverseStringTestCase).from_json(data).cases
  end
end

class ReverseStringTestCase < ExerciseTestCase
  class Input
    JSON.mapping(
      value: String
    )
  end

  JSON.mapping(
    description: String,
    property: String,
    input: Input,
    expected: String
  )

  def workload
    "ReverseString.reverse(\"#{input.value}\").should eq(\"#{expected}\")"
  end

  def test_name
    description
  end
end
