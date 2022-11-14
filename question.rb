class Question

  attr_reader :correct_answer

  def initialize(max_question)
    @first_number = rand((max_question / 5).to_i..(max_question))
    @second_number = rand((max_question / 5).to_i..(max_question))
    @correct_answer = @first_number + @second_number
  end

  def show_question
    "#{@first_number} + #{@second_number}?"
  end

end