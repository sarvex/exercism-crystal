require "../exercise_generator"
require "../test_cases"

class IsbnVerifierGenerator < ExerciseGenerator
  def exercise_name
    "isbn-verifier"
  end

  def test_cases
    TestCases(IsbnVerifierTestCase).from_json(data).cases
  end
end

class IsbnVerifierTestCase < ExerciseTestCase
  class Input
    JSON.mapping(
      isbn: String
    )
  end

  JSON.mapping(
    description: String,
    property: String,
    input: Input,
    expected: Bool
  )

  def workload
    "IsbnVerifier.valid?(\"#{input.isbn}\").should eq(#{expected})"
  end

  def test_name
    description
  end
end
