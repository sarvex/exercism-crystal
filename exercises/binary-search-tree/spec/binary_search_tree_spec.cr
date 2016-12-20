require "spec"
require "../src/*"

describe "Node" do
  it "sets the root node" do
    root = Node(Int32).new(1)
    root.value.should eq(1)
  end

  describe "#insert" do
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
      tree.should be_a(Enumerable(Int32))
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

    # Bonus!
    pending "is Iterable" do
      tree = Node(Int32).new(100)
      tree.insert(50)
      tree.insert(20)
      tree.insert(30)
      tree.should be_a(Iterable(Int32))
      iter = tree.each_cons(2)
      iter.next.should eq([20, 30])
      iter.next.should eq([30, 50])
      iter.next.should eq([50, 100])
    end
  end

  # Deletion from a binary search tree https://en.wikipedia.org/wiki/Binary_search_tree#Deletion
  # There are three possible cases to consider:
  # 1. Deleting a node with no children
  # 2. Deleting a node with one child
  # 3. Deleting a node with two children
  describe "#delete" do
    pending "can remove the root node" do
      tree = Node(Int32).new(5)
      tree.insert(2)
      tree.delete(5)
      tree.value.should eq(2)
    end

    pending "removes a node with no children" do
      tree = Node(Int32).new(5)
      tree.insert(2)
      tree.delete(2)
      tree.left.should be_nil
    end

    pending "removes a node with one child" do
      tree = Node(Int32).new(5)
      tree.insert(3)
      tree.insert(2)
      tree.delete(3)

      new_values = [2, 5]
      tree.each do |value|
        value.should eq(new_values.shift)
      end
    end

    pending "removes a node with two children" do
      tree = Node(Int32).new(5)
      tree.insert(3)
      tree.insert(2)
      tree.insert(4)
      tree.delete(3)

      new_values = [2, 4, 5]
      tree.each do |value|
        value.should eq(new_values.shift)
      end
    end

    pending "removes a left node with two child (complex)" do
      tree = Node(Int32).new(10)
      tree.insert(5)
      tree.insert(2)
      tree.insert(4)
      tree.insert(8)
      tree.insert(9)
      tree.insert(7)
      tree.delete(5)

      new_values = [2, 4, 7, 8, 9, 10]
      tree.each do |value|
        value.should eq(new_values.shift)
      end
    end

    pending "removes a right node with two children (complex)" do
      tree = Node(Int32).new(1)
      tree.insert(5)
      tree.insert(2)
      tree.insert(4)
      tree.insert(8)
      tree.insert(9)
      tree.insert(7)
      tree.delete(5)

      new_values = [1, 2, 4, 7, 8, 9]
      tree.each do |value|
        value.should eq(new_values.shift)
      end
    end
  end
end
