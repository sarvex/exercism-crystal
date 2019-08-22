require "../exercise_generator"
require "../exercise_test_case"

class SpaceAgeGenerator < ExerciseGenerator
  record TestCases, cases : Array(SpaceAgeTestCase) do
    include JSON::Serializable
  end

  def exercise_name
    "space-age"
  end

  def test_cases
    TestCases.from_json(data).cases
  end
end

class SpaceAgeTestCase < ExerciseTestCase
  class Input
    JSON.mapping(
      planet: String,
      seconds: Int32
    )
  end

  JSON.mapping(
    description: String,
    property: String,
    input: Input,
    expected: Float32
  )

  def workload
    "Space::Age.from_seconds(#{input.seconds}).#{property}_on_#{input.planet.downcase}.should be_close(#{expected}, 0.01)"
  end

  def test_name
    description
  end
end
