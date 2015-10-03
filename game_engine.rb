require_relative 'math_variables'
require_relative 'player'
require_relative 'game_ui'
require 'pry'

#Engine to manage all aspects of the game
class GameEngine

  def initialize

  end

  def calculate_question
    MathVariables.new
  end

  def validate_answer(player, turn, playeranswer, companswer)
    if playeranswer == comp
      Player.new.increase_score(player,turn)
      true
    else
      Player.new.decrease_lives(player,turn)
      false
    end
end


binding.pry