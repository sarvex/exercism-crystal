module PascalsTriangle
  extend self

  def rows(n : Int32)
    raise ArgumentError.new("Int must not be less than zero") if n < 0
    (0..(n - 1)).map do |m|
      m.times.reduce([1]) do |row, k|
        row << row[k] * (m - k) / (k + 1)
      end
    end
  end
end
