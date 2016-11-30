class Squares
  def self.square_of_sum(num)
    (num * (num + 1) / 2) ** 2
  end

  def self.sum_of_squares(num)
    num * (num + 1) * (2 * num + 1) / 6
  end

  def self.difference_of_squares(num)
    square_of_sum(num) - sum_of_squares(num)
  end
end
