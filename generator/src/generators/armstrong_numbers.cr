require "../exercise_generator"
require "../test_cases"

class ArmstrongNumbersGenerator < ExerciseGenerator
  def exercise_name
    "armstrong-numbers"
  end

  def test_cases
    TestCases(ArmstrongNumbersTestCase).from_json(data).cases
  end
end

class ArmstrongNumbersTestCase < ExerciseTestCase
  class Input
    JSON.mapping(
      number: Int32
    )
  end

  JSON.mapping(
    description: String,
    property: String,
    input: Input,
    expected: Bool
  )

  def workload
    "ArmstrongNumbers.armstrong_number?(#{input.number}).should eq(#{expected})"
  end

  def test_name
    description
  end
end
