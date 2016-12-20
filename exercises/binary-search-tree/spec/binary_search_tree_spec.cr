require "spec"
require "../src/*"

describe "Node" do
  it "sets the root node" do
    root = Node(Int32).new(1)
    root.value.should eq(1)
  end

  pending "inserts smaller values to the left" do
    tree = Node(Int32).new(4)
    tree.insert(2)

    left = tree.left.not_nil!
    left.value.should eq(2)

    tree.right.should be_nil
  end

  pending "inserts equal values to the left" do
    tree = Node(Int32).new(4)
    tree.insert(4)

    left_node = tree.left.not_nil!
    left_node.value.should eq(4)

    tree.right.should be_nil
  end

  pending "inserts greater values to the right" do
    tree = Node(Int32).new(4)
    tree.insert(5)

    right_node = tree.right.not_nil!
    right_node.value.should eq(5)

    tree.left.should be_nil
  end

  describe "#each" do
    pending "traverses the tree in order" do
      tree = Node(Int32).new(5)
      tree.insert(1)
      tree.insert(6)
      tree.insert(7)
      tree.insert(3)
      test_array = [1, 3, 5, 6, 7]

      tree.each do |value|
        value.should eq(test_array.shift)
      end
    end

    # Bonus!
    pending "is an Enumerable" do
      tree = Node(Int32).new(1)
      tree.insert(5)
      tree.insert(2)
      mapped_values = tree.map { |value| value * 10 }
      mapped_values.should eq([10, 20, 50])
    end

    # Advanced
    pending "will return an iterator if no block is provided" do
      tree = Node(Int32).new(1)
      tree.insert(5)
      tree.insert(2)
      iter = tree.each
      iter.next.should eq 1
      iter.next.should eq 2
      iter.next.should eq 5
    end

    # Bonus advanced
    pending "is Iterable" do
      tree = Node(Int32).new(100)
      tree.insert(50)
      tree.insert(20)
      tree.insert(30)
      tree.should be_a(Iterable(Int32))
    end
  end

  describe "#search" do
    pending "will return a node if a search if successful" do
      tree = Node(Int32).new(5)
      tree.insert(1)
      node = tree.search(1).not_nil!
      node.value.should eq(1)
    end

    pending "will return nil if a searched value is not found" do
      tree = Node(Int32).new(5)
      tree.search(4).should be_nil
    end
  end
end
