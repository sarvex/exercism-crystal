require "spec"
require "../src/*"

describe "Triangle" do
  it "all sides are equal" do
    Triangle.new({2, 2, 2}).equilateral?.should eq(true)
  end

  pending "any side is unequal" do
    Triangle.new({2, 3, 2}).equilateral?.should eq(false)
  end

  pending "no sides are equal" do
    Triangle.new({5, 4, 6}).equilateral?.should eq(false)
  end

  pending "all zero sides is not a triangle" do
    Triangle.new({0, 0, 0}).equilateral?.should eq(false)
  end

  pending "sides may be floats" do
    Triangle.new({0.5, 0.5, 0.5}).equilateral?.should eq(true)
  end

  pending "last two sides are equal" do
    Triangle.new({3, 4, 4}).isosceles?.should eq(true)
  end

  pending "first two sides are equal" do
    Triangle.new({4, 4, 3}).isosceles?.should eq(true)
  end

  pending "first and last sides are equal" do
    Triangle.new({4, 3, 4}).isosceles?.should eq(true)
  end

  pending "equilateral triangles are also isosceles" do
    Triangle.new({4, 4, 4}).isosceles?.should eq(true)
  end

  pending "no sides are equal" do
    Triangle.new({2, 3, 4}).isosceles?.should eq(false)
  end

  pending "first triangle inequality violation" do
    Triangle.new({1, 1, 3}).isosceles?.should eq(false)
  end

  pending "second triangle inequality violation" do
    Triangle.new({1, 3, 1}).isosceles?.should eq(false)
  end

  pending "third triangle inequality violation" do
    Triangle.new({3, 1, 1}).isosceles?.should eq(false)
  end

  pending "sides may be floats" do
    Triangle.new({0.5, 0.4, 0.5}).isosceles?.should eq(true)
  end

  pending "no sides are equal" do
    Triangle.new({5, 4, 6}).scalene?.should eq(true)
  end

  pending "all sides are equal" do
    Triangle.new({4, 4, 4}).scalene?.should eq(false)
  end

  pending "two sides are equal" do
    Triangle.new({4, 4, 3}).scalene?.should eq(false)
  end

  pending "may not violate triangle inequality" do
    Triangle.new({7, 3, 2}).scalene?.should eq(false)
  end

  pending "sides may be floats" do
    Triangle.new({0.5, 0.4, 0.6}).scalene?.should eq(true)
  end
end
