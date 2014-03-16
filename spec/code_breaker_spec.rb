require_relative '../lib/code_breaker'

describe CodeBreaker do

  before do
    @secret_code = "9172"
    @game = CodeBreaker.new(@secret_code)
  end

  [
    %w( 9345 X ),
    %w( 0945 * ),
    %w( 9375 XX ),
    %w( 0915 ** ),
    %w( 9175 XXX ),
    %w( 2915 *** ),
    %w( 9912 E )
  ].each do | guess_number, result |
    it %{ When the secret code is #{@secret_code} 
          and try to guess with #{guess_number} 
          the result is '#{result}' } do
      r = @game.guessWith(guess_number)
      r.should eq(result)
    end
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
    status = @game.status
    status.should eq("You won!")
  end
  
end
