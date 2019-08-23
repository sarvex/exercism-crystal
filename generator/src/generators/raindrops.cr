require "../exercise_generator"
require "../test_cases"

class RaindropsGenerator < ExerciseGenerator
  def exercise_name
    "raindrops"
  end

  def test_cases
    TestCases(RaindropsTestCase).from_json(data).cases
  end
end

class RaindropsTestCase < ExerciseTestCase
  class Input
    JSON.mapping(
      number: Int32
    )
  end

  JSON.mapping(
    description: String,
    property: String,
    input: Input,
    expected: String
  )

  def workload
    "Raindrops.#{property}(#{input.number}).should eq(\"#{expected}\")"
  end

  def test_name
    description
  end
end
