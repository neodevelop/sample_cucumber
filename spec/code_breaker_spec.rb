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
    %w( 9912 E ),
    %w( 9172 XXXX )
  ].each do | guess_number, result |
    it %{ When the secret code is #{@secret_code} 
          and try to guess with #{guess_number} 
          the result is '#{result}' } do
      r = @game.guessWith(guess_number)
      r.should eq(result)
    end
  end

  [
    [ 2 ,"1234","Try again!" ],
    [ 12,"1234","You lose!"  ],
    [ 1 ,"9172","You won!"  ]
  ].each do | attempts, guess_number, expected_status |
    it %{ When I try to guess #{attempts} 
          times and ask for the status game 
          the resul it '#{expected_status}' } do
      attempts.times do |t|
        @game.guessWith(guess_number)
      end
      @game.status.should eq(expected_status)
    end
  end
  
end
