class CodeBreaker

  def initialize(secretCode)
    @secretCode = secretCode
  end

  def guessWith(guessCode)
    r = ""
    (0..9).each do |n|
      if guessCode.count(n.to_s) > 1
        r += "E"
      end
    end
    unless r.size > 0
      guessCode.chars.each_with_index do |c,i| 
        exists = @secretCode.index(c)
        if exists
          if exists == i #count
            r += "X"
          else
            r += "*"
          end
        end
      end
    end
    r
  end
end
