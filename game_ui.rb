require_relative 'game_engine'

#Interaction module with user

class GameUI

  def initialize
    @player = []
    @playeranswer
    @answer
    @i
  end

  def get_player_names
    puts "Hello and welcome to mathaholics!"
    puts "The rules are quite simple, players will take turns answering math questions. Right answers will receive one point. You have 3 lives before the game ends"
    puts "To start, we will ask you how many players there are."
    print "How many people are playing?"
    @i = gets.chomp.to_i
    (1..i) do |n|
      print "Player #{n} name: "
      @player << Player.new(gets.chomp.capitalize)
    end
  end

  def ask_question
    @answer = GameEngine.new.calculate_question
    print "#{@player[@i-1].name} what is #{@answer.variable1} #{@answer.operator_text} #{@answer.variable2}? "
    @playeranswer = gets.chomp.to_i
  end

  def output_answer
    if GameEngine.new.validate_answer(@player, @i-1, @playeranswer, @answer)
      puts "You got the answer right!".green
    else
      puts "Wrong! The answer is #{@answer}".red
    end
  end

  def score_stats
    puts "#{@names[@turn]} you now have #{@score[@turn]} points and #{@lives[@turn]} lives left."
  end

  def reset
    @score = [0,0]
    @lives = [3,3]
  end

  def game_loop
    intro
    while @lives[@turn] > 0
      question_gen
      ask_question
      verify_answer
      score_stats
      if @lives[@turn] > 0
        @turn = @turn == 0 ? 1 : 0
        # if @turn == 0
        #   @turn = 1
        # else
        #   @turn = 0
        # end
      else
        puts "You have disappointed me #{@names[@turn]}. FAIL!".red
        puts "Do you want to keep playing? (Yes or No) "
        if gets.chomp.capitalize == "Yes"
          puts "Are the same players playing? (Yes or No) "
          if gets.chomp.capitalize == "Yes"
            reset
          else
            game_loop
          end
        else
          break
        end
      end
    end
  end

end