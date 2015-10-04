#Manages math variables
class MathVariables

  attr_reader :variable1, :variable2, :operator, :operator_text, :answer

  def initialize
    @operators = {
      :+ => "plus",
      :- => "less",
      :* => "multiplied by"
    }
    @variable1 = number_generator
    @variable2 = number_generator
    @operator = operator_generator
    @operator_text = operator_type(@operator)
    @answer = calculator(@variable1, @variable2, @operator)
  end

  #Generates random number from 1-20
  def number_generator
    rand(1..20)
  end

  #Determines random operator
  def operator_generator
    @operators.keys[rand(0..2)]
  end

  #Allows user to determine what the name of an operator is
  def operator_type(operator)
    @operators[operator]
  end

  #Calculates outcome
  def calculator(number1, number2, operator)
    number1.public_send(operator,number2)
  end

end

