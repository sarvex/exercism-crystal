require "../exercise_generator"
require "../test_case_group"

class IsogramGenerator < ExerciseGenerator
  def exercise_name
    "isogram"
  end

  def test_cases
    TestCaseGroup(IsogramTestCase).from_json(data).cases[0].cases
  end
end

class IsogramTestCase < ExerciseTestCase
  class Input
    JSON.mapping(
      phrase: String,
    )
  end

  JSON.mapping(
    description: String,
    property: String,
    input: Input,
    expected: Bool
  )

  def workload
    "Isogram.isogram?(\"#{input.phrase}\").should eq(#{expected})"
  end

  def test_name
    description
  end
end
