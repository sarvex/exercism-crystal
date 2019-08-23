require "../exercise_generator"
require "../test_cases"

class NthPrimeGenerator < ExerciseGenerator
  def exercise_name
    "nth-prime"
  end

  def test_cases
    TestCases(NthPrimeTestCase).from_json(data).cases
  end
end

class NthPrimeTestCase < ExerciseTestCase
  class Input
    JSON.mapping(
      number: Int32
    )
  end

  class Error
    JSON.mapping(
      error: String
    )
  end

  JSON.mapping(
    description: String,
    property: String,
    input: Input,
    expected: Int32 | Error
  )

  def workload
    if expected.is_a?(Error)
      <<-WL
      expect_raises(ArgumentError) do
            NthPrime.#{property}(#{input.number})
          end
      WL
    else
      "NthPrime.#{property}(#{input.number}).should eq(#{expected})"
    end
  end

  def test_name
    description
  end
end
