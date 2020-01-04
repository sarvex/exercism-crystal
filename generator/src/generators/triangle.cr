require "../exercise_generator"
require "../test_case_group"

class TriangleGenerator < ExerciseGenerator
  def exercise_name
    "triangle"
  end

  def test_cases
    TestCaseGroup(TriangleTestCase).from_json(data).all_cases
  end
end

class TriangleTestCase < ExerciseTestCase
  class Input
    JSON.mapping(
      sides: Tuple(Int32, Int32, Int32) | Tuple(Float64, Float64, Float64)
    )

    def to_s(io)
      io << "{#{sides.map { |s| s.to_i == s.to_f ? s.to_i : s.to_s }.join(", ")}}"
    end

    def valid_triangle?
      sorted_sides = sides.to_a.sort
      sides.all?(&.>(0)) && sorted_sides.last < sorted_sides.first(2).sum
    end
  end

  JSON.mapping(
    description: String,
    property: String,
    input: Input,
    expected: Bool
  )

  def workload
    if input.valid_triangle?
      "Triangle.new(#{input}).#{property}?.should eq(#{expected})"
    else
      <<-WL
      expect_raises(ArgumentError) do
            Triangle.new(#{input})
          end
      WL
    end
  end

  def test_name
    description
  end
end
