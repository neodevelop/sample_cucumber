class CodeBreaker

  def initialize(secretCode)
    @secretCode = secretCode
    @numberOfTries = 0
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
    @numberOfTries+=1
    r
  end
  
  def status
    if @numberOfTries < 12
      "Try again!"
    else
      "You lose!"
    end
  end

end
