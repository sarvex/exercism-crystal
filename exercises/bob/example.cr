class Bob
  def self.hey(string : String)
    case
    when self.is_silence?(string)
      "Fine. Be that way!"
    when self.is_shouting?(string)
      "Whoa, chill out!"
    when self.is_question?(string)
      "Sure."
    else
      "Whatever."
    end
  end

  :private

  def self.is_silence?(string : String)
    string.gsub(/\s+/, "").empty?
  end

  def self.is_shouting?(string : String)
    string == string.upcase && string =~ /[A-Z]/
  end

  def self.is_question?(string : String)
    string[string.size - 1] == '?'
  end
end
