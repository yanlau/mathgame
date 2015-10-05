#Player data management

class Player

  attr_accessor :name, :score, :lives

  def initialize(name)
    @name = name
    @score = 0
    @lives = 3
  end

  class << self

    def decrease_lives(player)
      player.lives -= 1
    end

    def increase_score(player)
      player.score += 1
    end

    def reset(player)
      player.each do |reset|
        reset.score = 0
        reset.lives = 3
      end
    end

    def turn_counter(current_turn, number_of_players)
      if current_turn == (number_of_players - 1)
        0
      else
        current_turn += 1
      end
    end

  end

end