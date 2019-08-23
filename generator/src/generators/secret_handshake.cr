require "../exercise_generator"
require "../test_case_group"

class SecretHandshakeGenerator < ExerciseGenerator
  def exercise_name
    "secret-handshake"
  end

  def test_cases
    TestCaseGroup(SecretHandshakeTestCase).from_json(data).cases[0].cases
  end
end

class SecretHandshakeTestCase < ExerciseTestCase
  class Input
    JSON.mapping(
      number: Int32
    )
  end

  JSON.mapping(
    description: String,
    property: String,
    input: Input,
    expected: Array(String)
  )

  def fix_empty_array(handshake : Array(String)) : String
    handshake.size == 0 ? "[] of String" : handshake.to_s
  end

  def workload
    "SecretHandshake.#{property}(#{input.number}).should eq(#{fix_empty_array(expected)})"
  end

  def test_name
    description
  end
end
