require "../exercise_generator"
require "../test_cases"

class ResistorColorDuoGenerator < ExerciseGenerator
  def exercise_name
    "resistor-color-duo"
  end

  def test_cases
    TestCases(ResistorColorDuoTestCase).from_json(data).cases
  end
end

class ResistorColorDuoTestCase < ExerciseTestCase
  class Input
    JSON.mapping(
      colors: Array(String)
    )
  end

  JSON.mapping(
    description: String,
    property: String,
    input: Input,
    expected: Int32
  )

  def workload
    "ResistorColorDuo.#{property}(#{input.colors}).should eq(#{expected})"
  end

  def test_name
    description
  end
end
