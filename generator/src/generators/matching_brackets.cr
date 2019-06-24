require "../exercise_generator"
require "../exercise_test_case"

class MatchingBracketsGenerator < ExerciseGenerator
  def exercise_name
    "matching-brackets"
  end

  def test_cases
    JSON.parse(data)["cases"].as_a.map do |test_case|
      MatchingBracketsTestCase.from_json(test_case.to_json)
    end
  end
end

class MatchingBracketsTestCase < ExerciseTestCase
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
    "MatchingBrackets.valid?(\"#{input.value}\").should eq(#{expected})"
  end

  def test_name
    description
  end
end
