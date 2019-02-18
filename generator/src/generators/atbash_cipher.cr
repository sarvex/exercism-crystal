require "../exercise_generator"
require "../exercise_test_case"

class AtbashCipherGenerator < ExerciseGenerator
  def exercise_name
    "atbash-cipher"
  end

  def test_cases
    JSON.parse(data)["cases"].as_a.flat_map do |case_group|
      case_group["cases"].as_a.map do |test_case|
        AtbashCipherTestCase.from_json(test_case.to_json)
      end
    end
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
