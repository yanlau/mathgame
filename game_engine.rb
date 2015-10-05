require_relative 'math_variables'
require_relative 'player'

#Engine to manage all aspects of the game
class GameEngine 

  # def initialize

  # end
  class << self
    def calculate_question
      MathVariables.new
    end

    def validate_answer(playeranswer, companswer)
      playeranswer == companswer
    end
  end
end