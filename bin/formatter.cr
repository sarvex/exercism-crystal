class Formatter
  def self.post_proccesing(file_name)
    # This function is suppose to do some post processing on the generated file
    # It will format big data set, like arrays or hashes, to be more readable
    result = File.read(file_name).split("\n").map do |line|
      if line.size > 100
        index = line.gsub(" ", "").index("=") || -1
        if (line.gsub(" ", "")[index + 1] == '{' || line.gsub(" ", "")[index + 1] == '[') && (line[-1] == ']' || line[-1] == '}') && index != -1
          line_2 = line
          count_characters = 0
          count_lines = 1
          brackets = [] of Char
          line_2.each_char.with_index do |character, index|
            if ("[](){}".includes?(character.to_s) && (brackets[-1]? != '"' || brackets[-1]?.nil?)) || '"' == character
              if "[({".includes?(character.to_s) || (brackets[-1]? != '"' && '"' == character)
                brackets << character
              else
                brackets.pop
              end
            end
            count_characters += 1
            if character == ',' && count_characters > 100 && index > 1 && brackets.size == 1
              line = line.insert(index + count_lines, "\n")
              count_characters = 0
              count_lines += 1
            end
          end
        end
      end
      line
    end
    result.join("\n")
  end
end
