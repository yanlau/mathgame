require_relative 'math_variables'
require_relative 'player'

#Engine to manage all aspects of the game
class GameEngine 

  def initialize

  end

  def self.calculate_question
    MathVariables.new
  end

  def self.validate_answer(player, turn, playeranswer, companswer)
    if playeranswer == companswer
      Player.increase_score(player, turn)
      true
    else
      Player.decrease_lives(player,turn)
      false
    end
  end
end