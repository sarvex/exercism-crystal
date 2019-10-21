require "../exercise_generator"
require "../test_cases"

class HelloWorldGenerator < ExerciseGenerator
  def exercise_name
    "hello-world"
  end

  def test_cases
    TestCases(HelloWorldTestCase).from_json(data).cases
  end
end

class HelloWorldTestCase < ExerciseTestCase
  JSON.mapping(
    description: String,
    property: String,
    expected: String
  )

  def workload
    "HelloWorld.hello.should eq(\"#{expected}\")"
  end

  def test_name
    description
  end
end
