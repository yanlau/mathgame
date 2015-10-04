#Player data management

class Player

  attr_accessor :name, :score, :lives

  def initialize(name)
    @name = name
    @score = 0
    @lives = 3
  end

  def self.decrease_lives(player, turn)
    player[turn].lives -= 1
  end

  def self.increase_score(player, turn)
    player[turn].score += 1
  end

  def self.reset(player)
    player.each do |reset|
      reset.score = 0
      reset.lives = 3
    end
  end

  def self.turn_counter(current_turn, number_of_players)
    if current_turn == (number_of_players - 1)
      0
    else
      current_turn += 1
    end
  end


end