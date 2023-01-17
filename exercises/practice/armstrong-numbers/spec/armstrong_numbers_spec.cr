require "spec"
require "../src/*"

describe "ArmstrongNumbers" do
  it "Zero is an Armstrong number" do
    ArmstrongNumbers.armstrong_number?(0).should eq(true)
  end

  pending "Single digit numbers are Armstrong numbers" do
    ArmstrongNumbers.armstrong_number?(5).should eq(true)
  end

  pending "There are no 2 digit Armstrong numbers" do
    ArmstrongNumbers.armstrong_number?(10).should eq(false)
  end

  pending "Three digit number that is an Armstrong number" do
    ArmstrongNumbers.armstrong_number?(153).should eq(true)
  end

  pending "Three digit number that is not an Armstrong number" do
    ArmstrongNumbers.armstrong_number?(100).should eq(false)
  end

  pending "Four digit number that is an Armstrong number" do
    ArmstrongNumbers.armstrong_number?(9474).should eq(true)
  end

  pending "Four digit number that is not an Armstrong number" do
    ArmstrongNumbers.armstrong_number?(9475).should eq(false)
  end

  pending "Seven digit number that is an Armstrong number" do
    ArmstrongNumbers.armstrong_number?(9926315).should eq(true)
  end

  pending "Seven digit number that is not an Armstrong number" do
    ArmstrongNumbers.armstrong_number?(9926314).should eq(false)
  end

  pending "Armstrong number containing seven zeroes" do
    ArmstrongNumbers.armstrong_number?(186709961001538790100634132976990_i128).should eq(true)
  end

  pending "The largest and last Armstrong number" do
    ArmstrongNumbers.armstrong_number?(115132219018763992565095597973971522401_i128).should eq(true)
  end
end
