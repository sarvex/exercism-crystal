class RnaComplement
  def self.ofDna(strand : String)
    strand.tr("CGTA", "GCAU")
  end
end
