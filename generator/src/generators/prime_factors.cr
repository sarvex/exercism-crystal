require "../exercise_generator"
require "../test_case_group"

class PrimeFactorsGenerator < ExerciseGenerator
  def exercise_name
    "prime-factors"
  end

  def test_cases
    TestCaseGroup(PrimeFactorsTestCase).from_json(data).all_cases
  end
end

class PrimeFactorsTestCase < ExerciseTestCase
  class Input
    JSON.mapping(
      value: Int64
    )
  end

  JSON.mapping(
    description: String,
    property: String,
    input: Input,
    expected: Array(Int32)
  )

  def workload
    "PrimeFactors.#{property}(#{input.value}).should eq(#{fix_empty_array(expected)})"
  end

  private def fix_empty_array(expected)
    if expected.empty?
      "[] of Int32"
    else
      expected
    end
  end

  def test_name
    description
  end
end
