require "../exercise_generator"
require "../test_case_group"

class DifferenceOfSquaresGenerator < ExerciseGenerator
  def exercise_name
    "difference-of-squares"
  end

  def test_cases
    TestCaseGroup(DifferenceOfSquaresTestCase).from_json(data).all_cases
  end
end

class DifferenceOfSquaresTestCase < ExerciseTestCase
  class Input
    JSON.mapping(
      number: Int32
    )
  end

  JSON.mapping(
    description: String,
    property: String,
    input: Input,
    expected: Int32
  )

  def workload
    "Squares.#{property.gsub(/([A-Z])/, "_\\1").downcase}(#{input.number}).should eq(#{expected})"
  end

  def test_name
    "calculates #{description} is #{expected}"
  end
end
