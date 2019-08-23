require "../exercise_generator"
require "../test_case_group"

class AtbashCipherGenerator < ExerciseGenerator
  def exercise_name
    "atbash-cipher"
  end

  def test_cases
    TestCaseGroup(AtbashCipherTestCase).from_json(data).all_cases
  end
end

class AtbashCipherTestCase < ExerciseTestCase
  class Input
    JSON.mapping(
      phrase: String
    )
  end

  JSON.mapping(
    description: String,
    property: String,
    input: Input,
    expected: String
  )

  def workload
    "AtbashCipher.#{property}(\"#{input.phrase}\").should eq(\"#{expected}\")"
  end

  def test_name
    description
  end
end
