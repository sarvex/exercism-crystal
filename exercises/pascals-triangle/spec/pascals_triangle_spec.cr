require "spec"
require "../src/*"

describe "PascalsTriangle" do
  it "will return the first 0 row(s)" do
    PascalsTriangle.rows(0).should eq([] of Int32)
  end

  pending "will return the first 1 row(s)" do
    PascalsTriangle.rows(1).should eq([[1]])
  end

  pending "will return the first 2 row(s)" do
    PascalsTriangle.rows(2).should eq([[1], [1, 1]])
  end

  pending "will return the first 3 row(s)" do
    PascalsTriangle.rows(3).should eq([[1], [1, 1], [1, 2, 1]])
  end

  pending "will return the first 4 row(s)" do
    PascalsTriangle.rows(4).should eq([[1], [1, 1], [1, 2, 1], [1, 3, 3, 1]])
  end

  pending "will raise an Argument error for negative rows" do
    expect_raises do
      PascalsTriangle.rows(-1)
    end
  end
end
