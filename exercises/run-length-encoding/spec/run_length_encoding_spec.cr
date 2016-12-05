require "spec"
require "../src/*"

describe "RunLengthEncoding" do
  it "encode empty string" do
    RunLengthEncoding.encode("").should eq("")
  end

  pending "encode single characters only" do
    RunLengthEncoding.encode("XYZ").should eq("XYZ")
  end

  pending "decode empty string" do
    RunLengthEncoding.decode("").should eq("")
  end

  pending "decode single characters only" do
    RunLengthEncoding.decode("XYZ").should eq("XYZ")
  end

  pending "encode simple" do
    RunLengthEncoding.encode("AABBBCCCC").should eq("2A3B4C")
  end

  pending "decode simple" do
    RunLengthEncoding.decode("2A3B4C").should eq("AABBBCCCC")
  end

  pending "encode with single values" do
    RunLengthEncoding.encode("WWWWWWWWWWWWBWWWWWWWWWWWWBBBWWWWWWWWWWWWWWWWWWWWWWWWB").should eq("12WB12W3B24WB")
  end

  pending "decode with single values" do
    RunLengthEncoding.decode("12WB12W3B24WB").should eq("WWWWWWWWWWWWBWWWWWWWWWWWWBBBWWWWWWWWWWWWWWWWWWWWWWWWB")
  end
end
