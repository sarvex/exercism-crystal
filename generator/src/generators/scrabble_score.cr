require "../exercise_generator"
require "../test_cases"

class ScrabbleScoreGenerator < ExerciseGenerator
  def exercise_name
    "scrabble-score"
  end

  def test_cases
    TestCases(ScrabbleScoreCase).from_json(data).cases
  end
end

class ScrabbleScoreCase < ExerciseTestCase
  class Input
    JSON.mapping(
      word: String,
    )
  end

  JSON.mapping(
    description: String,
    property: String,
    input: Input,
    expected: Int32
  )

  def workload
    "ScrabbleScore.score(\"#{input.word}\").should eq(#{expected})"
  end

  def test_name
    description
  end
end
