module MathGame
  class Player
      attr_reader :name #name cannot be changed
      attr_accessor :lives #sets lives to be adjustable by the game

      def initialize(name)
          @name = name
          @lives = 3
          puts "Player #{name} created with #{lives} lives."
      end
  end
end