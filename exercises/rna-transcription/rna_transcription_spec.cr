require "spec"
require "./rna_transcription"

describe "RnaComplement" do
  describe "#ofDna" do
    it "correctly transcribes cytosine to guanine" do
      RnaComplement.ofDna("C").should eq "G"
    end

    pending "correctly transcribes guanine to cytocine" do
      RnaComplement.ofDna("G").should eq "C"
    end

    pending "correctly transcribes thymine to adenine" do
      RnaComplement.ofDna("T").should eq "A"
    end

    pending "correctly transcribes adenine to uracil" do
      RnaComplement.ofDna("A").should eq "U"
    end

    pending "correctly transcribes all dna nucleotides to their rna compliment" do
      RnaComplement.ofDna("ACGTGGTCTTAA").should eq "UGCACCAGAAUU"
    end
  end
end
