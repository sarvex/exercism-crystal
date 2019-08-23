require "../exercise_generator"
require "../test_cases"

class PangramGenerator < ExerciseGenerator
  def exercise_name
    "pangram"
  end

  def test_cases
    TestCases(PangramTestCase).from_json(data).cases
  end
end

class PangramTestCase < ExerciseTestCase
  class Input
    JSON.mapping(
      sentence: String,
    )
  end

  JSON.mapping(
    description: String,
    property: String,
    input: Input,
    expected: Bool
  )

  def workload
    "Pangram.pangram?(\"#{input.sentence.gsub("\"", "\\\"")}\").should eq(#{expected})"
  end

  def test_name
    description
  end
end
