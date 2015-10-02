#Introduce game and ask for player name
def intro
  @names = []
  @score = [0, 0]
  @lives = [3, 3]
  puts "Hello and welcome to mathaholics, a 2 player game!"
  puts "The rules are quite simple, 2 players will take turns answering math questions. Right answers will receive one point. You have 3 lives before the game ends"
  puts "To start, we will ask for your name. Player 1, what's your name?"
  print "Player 1 name: "
  @names << gets.chomp.capitalize
  puts "Player 2 what is your name?"
  print "Player 2 name: "
  @names << gets.chomp.capitalize
end

def question_gen
  @numbers = []
  @numbers << rand(1..20)
  @numbers << rand(1..20)
  @operator = @operators.keys[rand(0..2)]
  @answer = @numbers[0].public_send(@operator,@numbers[1])
end

def ask_question
  print "#{@names[@turn]} what is #{@numbers[0]} #{@operators[@operator]} #{@numbers[1]}? "
  @playeranswer = gets.chomp.to_i
end

def verify_answer
  if @playeranswer == @answer
    @score[@turn] += 1
    puts "You got the answer right!".green
  else
    @lives[@turn] -= 1
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
      if @turn == 0
        @turn = 1
      else
        @turn = 0
      end
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