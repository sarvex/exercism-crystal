class Year
  def self.is_leap?(year : Int)
    Year.new(year).is_leap?
  end

  :private

  def initialize(year : Int)
    @year = year
  end

  def is_leap?
    divisable_by?(400) || divisable_by?(4) && !divisable_by?(100)
  end

  def divisable_by?(number : Int)
    @year % number == 0
  end
end
