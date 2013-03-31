require_relative '../lib/code_breaker'

describe CodeBreaker do
  before do
    @game = CodeBreaker.new("9172")
  end

  it "When the secret code is 9172 and try to guess with 9345 the result is 'X' " do
    r = @game.guessWith("9345")
    r.should eq("X")
  end

  it "When the secret code is 9172 and try to guess with 0945 the result is '*' " do
    r = @game.guessWith("0945")
    r.should eq("*")
  end

  it "When the secret code is 9172 and try to guess with 9375 the result is 'XX' " do
    r = @game.guessWith("9375")
    r.should eq("XX")
  end

  it "When the secret code is 9172 and try to guess with 0915 the result is '**' " do
    r = @game.guessWith("0915")
    r.should eq("**")
  end

  it "When the secret code is 9172 and try to guess with 9175 the result is 'XXX' " do
    r = @game.guessWith("9175")
    r.should eq("XXX")
  end

  it "When the secret code is 9172 and try to guess with 2915 the result is '***' " do
    r = @game.guessWith("2915")
    r.should eq("***")
  end

  it "When the secret code is 9172 and try to guess with 9912 the result is 'E' " do
    r = @game.guessWith("9912")
    r.should eq("E")
  end

  it "When I try to guess 2 times and ask for the status game the resul it 'Try again!'" do
    2.times do |t|
      @game.guessWith("1234")
    end
    status = @game.status
    status.should eq("Try again!")
  end

  it "When I try to guess 12 times and ask for the status game the resul it 'You lose!'" do
    12.times do |t|
      @game.guessWith("1234")
    end
    status = @game.status
    status.should eq("You lose!")
  end

  it "When the secret code is 9172 and try to guess with 9172 the result is 'XXXX'" do
    r = @game.guessWith("9172")
    r.should eq("XXXX")
  end
  
end
