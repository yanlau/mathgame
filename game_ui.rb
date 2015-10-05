require 'colorize'
require_relative 'game_engine'

#Interaction module with user

class GameUI

  def initialize
    @players = []
    @playeranswer = nil
    @calculated = nil
    @num_player = nil
    @turn = 0
  end

  def get_number_players
    puts "Hello and welcome to mathaholics!"
    puts "The rules are quite simple, players will take turns answering math questions. Right answers will receive one point. You have 3 lives before the game ends"
    puts "To start, we will ask you how many players there are."
    print "How many people are playing? "
    @num_player = gets.to_i
  end

  def get_player_names
    (1..@num_player).each do |player_number|
      print "Player #{player_number} name: "
      @players << Player.new(gets.chomp.capitalize)
    end
  end

  def ask_question
    @calculated = GameEngine.calculate_question
    print "#{@player[@turn].name} what is #{@calculated.variable1} #{@caculated.operator_text} #{@calculated.variable2}? "
    @playeranswer = gets.to_i
  end

  def output_answer
    if GameEngine.validate_answer(@playeranswer, @calculated.answer)
      Player.increase_score(@player[@turn])
      puts "You got the answer right!".green
    else
      Player.decrease_lives(@player[@turn])
      puts "Wrong! The answer is #{@calculated.answer}".red
    end
  end

  def advance_turn
    @turn = Player.turn_counter(@turn, @num_player)
  end

  def score_stats
    puts "#{@players[@turn].name} you now have #{@players[@turn].score} points and #{@players[@turn].lives} lives left."
  end

  def game_play
    get_number_players
    get_player_names
    begin
      ask_question
      output_answer
      score_stats
      if @player[@turn].lives > 0
        advance_turn
      else
        puts "You have disappointed me #{@players[@turn].name}. FAIL!".red
        puts "Do you want to keep playing? (Yes or No) "
        if gets.chomp.capitalize == "Yes"
          puts "Are the same players playing? (Yes or No) "
          if gets.chomp.capitalize == "Yes" 
            Player.reset(@players)
          else
            get_number_players
            get_player_names
            Player.reset(@players)
          end
        end
      end
    end while @players[@turn].lives > 0
  end
end