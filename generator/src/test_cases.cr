require "json"
require "./exercise_test_case"

struct TestCases(CaseType)
  include JSON::Serializable
  property cases : Array(CaseType)
end
