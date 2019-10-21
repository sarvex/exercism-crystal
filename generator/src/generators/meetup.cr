require "../exercise_generator"
require "../test_cases"

class MeetupGenerator < ExerciseGenerator
  def exercise_name
    "meetup"
  end

  def test_cases
    TestCases(MeetupTestCase).from_json(data).cases
  end
end

class MeetupTestCase < ExerciseTestCase
  class Input
    JSON.mapping(
      year: Int32,
      month: Int32,
      week: String,
      dayofweek: String
    )
  end

  JSON.mapping(
    description: String,
    property: String,
    input: Input,
    expected: String
  )

  def workload
    "Meetup.#{property}(#{input.year}, #{input.month}, \"#{input.week}\", \"#{input.dayofweek}\").should eq(\"#{expected}\")"
  end

  def test_name
    description
  end
end
