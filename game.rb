class Game
    attr_reader :current_round, :max_question, :current_player

    def initialize
        @active_player = nil
        @current_round = 0
        @max_question = 20
        puts("Game initialized #{self.current_round}")
    end

    def init_players
        puts 'Let the games begin!'
        puts 'Player 1, enter your name'
        p1 = gets.chomp
        @player1 = MathGame::Player.new(p1)
        puts 'Player 2, enter your name'
        p2 = gets.chomp
        @player2 = MathGame::Player.new(p2)
        puts "Welcome players #{@player1.name} and #{@player2.name}!"
    end

    def switch_players
      if (@current_player == @player1)
        @current_player = @player2
      else
        @current_player = @player1
      end
    end

    def end_game
      puts "\n ***** GAME OVER ****** "
      puts "#{@current_player.name}, You are out of lives.\n \n"
      switch_players
      puts "#{@current_player.name}, You WIN! You survived #{current_round} rounds. Congratulations."
    end

    def start_game
      init_players
      @current_player = @player1
      
      while (@current_player.lives > 0)
        run_round
      end

      end_game
    end

    def run_round
      @current_round += 1
      q = Question.new(@max_question)
      puts "Question #{@current_round}"
      puts "#{@current_player.name}, please answer #{q.show_question}"
      answer = gets.chomp
      if answer.to_i == q.correct_answer
          puts "#{@current_player.name}: Correct! You so smart."

      else
          puts "#{@current_player.name}: Sad.. The correct answer was #{q.correct_answer}. Lose a life."
          @current_player.lives -= 1; # decrement player lives
          puts "#{@current_player.name} has #{current_player.lives} lives remaining."
      end
      switch_players
    end 
end
