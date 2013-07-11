class CodeBreaker

  attr_accessor :status

  def initialize(secretCode)
    @secretCode = secretCode
    @numberOfTries = 0
    @guessed = false
    @status = ''
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
    @guessed = true if r == "XXXX"
    @numberOfTries += 1
    check()
    r
  end
  
  def check
    if @guessed then 
      @status = "You won!"
    else
      if @numberOfTries < 12  
        @status = "Try again!"
      else
        @status = "You lose!"
      end
    end
  end

end
