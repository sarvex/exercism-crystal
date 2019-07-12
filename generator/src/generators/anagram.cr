require "../exercise_generator"
require "../exercise_test_case"

class AnagramGenerator < ExerciseGenerator
  def exercise_name
    "anagram"
  end

  def test_cases
    JSON.parse(data)["cases"].as_a.map do |test_case|
      AnagramTestCase.from_json(test_case.to_json)
    end
  end
end

class AnagramTestCase < ExerciseTestCase
  class Input
    JSON.mapping(
      subject: String,
      candidates: Array(String)
    )
  end

  JSON.mapping(
    description: String,
    property: String,
    input: Input,
    expected: Array(String)
  )

  def workload
    "Anagram.find(\"#{input.subject}\", #{input.candidates}).should eq #{fix_empty_array(expected)}"
  end

  private def fix_empty_array(expected)
    if expected.empty?
      "[] of String"
    else
      expected
    end
  end

  def test_name
    description
  end
end
