Feature: Play the codebreaker game

  In order to start to play codebreaker(mastermind)
  As a player
  I wanna guess the secret code

  Scenario: Show the input space to start the game
    Given I am viewing "/"
    Then I should see "Start to play" 
    And I should be prepared to enter a number

  Scenario: I guess the code of the game
    Given I am viewing "/"
    And I should be prepared to enter a number
    When I fill with the code 2345
    And click "Play"
    Then I should see "Try again!"

