require "../exercise_generator"
require "../test_cases"

class TwoFerGenerator < ExerciseGenerator
  def exercise_name
    "two-fer"
  end

  def test_cases
    TestCases(TwoFerTestCase).from_json(data).cases
  end
end

class TwoFerTestCase < ExerciseTestCase
  class Input
    JSON.mapping(
      name: String | Nil,
    )
  end

  JSON.mapping(
    description: String,
    property: String,
    input: Input,
    expected: String
  )

  def test_case_argument(name)
    "(\"#{name}\")" unless name == nil
  end

  def workload
    "TwoFer.two_fer#{test_case_argument(input.name)}.should eq(\"#{expected}\")"
  end

  def test_name
    description
  end
end
