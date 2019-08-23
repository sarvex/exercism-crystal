require "../exercise_generator"
require "../test_case_group"

class ProteinTranslationGenerator < ExerciseGenerator
  def exercise_name
    "protein-translation"
  end

  def test_cases
    TestCaseGroup(ProteinTranslationTestCase).from_json(data).all_cases
  end
end

class ProteinTranslationTestCase < ExerciseTestCase
  class Input
    JSON.mapping(
      strand: String
    )
  end

  JSON.mapping(
    description: String,
    property: String,
    input: Input,
    expected: Array(String)
  )

  def workload
    "ProteinTranslation.#{property}(\"#{input.strand}\").should eq(#{fix_empty_array(expected)})"
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
