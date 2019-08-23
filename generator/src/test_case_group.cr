require "json"
require "./exercise_test_case"

# A nested group of test cases
struct TestCaseGroup(CaseType)
  struct Group(T)
    include JSON::Serializable
    property description : String,
      cases : Array(T)
  end

  include JSON::Serializable
  property cases : Array(Group(CaseType))

  # The flattened list of all test cases
  def all_cases : Array(CaseType)
    @cases.reduce([] of CaseType) do |cases, this_case_set|
      cases + this_case_set.cases
    end
  end
end
