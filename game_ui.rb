require_relative 'game_engine'
require 'colorize'
#Interaction module with user

class GameUI

  def initialize
    @player = []
    @playeranswer
    @answer
    @num_player
    @turn = 0
  end

  def get_number_players
    puts "Hello and welcome to mathaholics!"
    puts "The rules are quite simple, players will take turns answering math questions. Right answers will receive one point. You have 3 lives before the game ends"
    puts "To start, we will ask you how many players there are."
    print "How many people are playing? "
    @num_player = gets.chomp.to_i
  end

  def get_player_names
    (1..@num_player).each do |n|
      print "Player #{n} name: "
      @player << Player.new(gets.chomp.capitalize)
    end
  end

  def ask_question
    @answer = GameEngine.calculate_question
    print "#{@player[@turn].name} what is #{@answer.variable1} #{@answer.operator_text} #{@answer.variable2}? "
    @playeranswer = gets.chomp.to_i
  end

  def output_answer
    if GameEngine.validate_answer(@player, @turn, @playeranswer, @answer.answer)
      puts "You got the answer right!".green
    else
      puts "Wrong! The answer is #{@answer.answer}".red
    end
  end

  def advance_turn
    @turn = Player.turn_counter(@turn, @num_player)
  end

  def score_stats
    puts "#{@player[@turn].name} you now have #{@player[@turn].score} points and #{@player[@turn].lives} lives left."
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
        puts "You have disappointed me #{@player[@turn].name}. FAIL!".red
        puts "Do you want to keep playing? (Yes or No) "
        if gets.chomp.capitalize == "Yes"
          puts "Are the same players playing? (Yes or No) "
          if gets.chomp.capitalize == "Yes"
            Player.reset(@player)
          else
            game_play
          end
        end
      end
    end while @player[@turn].lives > 0
  end
end

binding.pry