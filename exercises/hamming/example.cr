require "levenshtein"

class Hamming
  def self.compute(strand1 : String, strand2 : String)
    if strand1.size == strand2.size
      Levenshtein.distance(strand1, strand2)
    else
      raise ArgumentError.new(message = "Strands must be of equal length")
    end
  end
end
