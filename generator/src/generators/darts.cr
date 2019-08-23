require "../exercise_generator"
require "../test_cases"

class DartsGenerator < ExerciseGenerator
  def exercise_name
    "darts"
  end

  def test_cases
    TestCases(DartsCase).from_json(data).cases
  end
end

class DartsCase < ExerciseTestCase
  class Input
    JSON.mapping(
      x: Float32,
      y: Float32
    )
  end

  JSON.mapping(
    description: String,
    property: String,
    input: Input,
    expected: Int32
  )

  def workload
    "Darts.#{property}(#{input.x}, #{input.y}).should eq(#{expected})"
  end

  def test_name
    description
  end
end
