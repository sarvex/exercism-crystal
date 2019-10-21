require "../exercise_generator"
require "../test_case_group"

class GrainsGenerator < ExerciseGenerator
  struct TestCases
    struct Group
      include JSON::Serializable
      property cases : Array(GrainsTestCase)
    end

    include JSON::Serializable
    property cases : Array(GrainsTestCase | Group)

    def total_case : GrainsTestCase
      cases.find(&.is_a?(GrainsTestCase)).not_nil!.as GrainsTestCase
    end

    def square_cases : Array(GrainsTestCase)
      cases.find(&.is_a?(Group)).not_nil!.as(Group).cases
    end

    @[JSON::Field(ignore: true)]
    property all_cases : Array(GrainsTestCase) do
      square_cases << total_case
    end
  end

  def exercise_name
    "grains"
  end

  def test_cases
    TestCases.from_json(data).all_cases
  end
end

class GrainsTestCase < ExerciseTestCase
  class Input
    JSON.mapping(
      square: Int32 | Nil
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
    expected: UInt64 | Error
  )

  def workload
    if expected.is_a?(Error)
      <<-WL
      expect_raises(ArgumentError) do
            Grains.#{property}(#{input.square})
          end
      WL
    elsif input.square
      "Grains.#{property}(#{input.square}).should eq(#{expected})"
    else
      "Grains.#{property}.should eq(#{expected})"
    end
  end

  def test_name
    description
  end
end
