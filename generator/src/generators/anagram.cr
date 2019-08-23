require "../exercise_generator"
require "../test_cases"

class AnagramGenerator < ExerciseGenerator
  def exercise_name
    "anagram"
  end

  def test_cases
    TestCases(AnagramTestCase).from_json(data).cases
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
