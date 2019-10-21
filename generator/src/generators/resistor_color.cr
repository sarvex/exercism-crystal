require "../exercise_generator"
require "../exercise_test_case"

class ResistorColorGenerator < ExerciseGenerator
  struct TestCases
    struct Group
      include JSON::Serializable
      property cases : Array(ResistorColorTestCase)
    end

    include JSON::Serializable
    property cases : Array(ResistorColorTestCase | Group)

    def color_code_cases : Array(ResistorColorTestCase)
      cases.find(&.is_a?(Group)).not_nil!.as(Group).cases
    end

    def colors_case
      cases.find(&.is_a?(ResistorColorTestCase)).not_nil!.as(ResistorColorTestCase)
    end

    @[JSON::Field(ignore: true)]
    property all_cases : Array(ResistorColorTestCase) do
      color_code_cases << colors_case
    end
  end

  def exercise_name
    "resistor-color"
  end

  def test_cases
    TestCases.from_json(data).all_cases
  end
end

class ResistorColorTestCase < ExerciseTestCase
  class Input
    JSON.mapping(
      color: String | Nil
    )
  end

  JSON.mapping(
    description: String,
    property: String,
    input: Input,
    expected: Int32 | Array(String)
  )

  def workload
    if input.color
      "ResistorColor.#{property.gsub(/([A-Z])/, "_\\1").downcase}(\"#{input.color}\").should eq(#{expected})"
    else
      "ResistorColor.#{property.gsub(/([A-Z])/, "_\\1").downcase}.should eq(#{expected})"
    end
  end

  def test_name
    description
  end
end
