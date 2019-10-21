require "../exercise_generator"
require "../test_case_group"

class AcronymGenerator < ExerciseGenerator
  def exercise_name
    "acronym"
  end

  def test_cases
    TestCaseGroup(AcronymTestCase).from_json(data).cases[0].cases
  end
end

class AcronymTestCase < ExerciseTestCase
  class Input
    JSON.mapping(
      phrase: String,
    )
  end

  JSON.mapping(
    description: String,
    property: String,
    input: Input,
    expected: String
  )

  def workload
    "Acronym.abbreviate(\"#{input.phrase}\").should eq(\"#{expected}\")"
  end

  def test_name
    "does #{description}"
  end
end
