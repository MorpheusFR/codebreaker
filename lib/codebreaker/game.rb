module Codebreaker
  # Comment to rubocop
  class Game
    attr_reader :input_code, :hints, :total_attempts, :result_of_an_attempt

    def initialize
      @secret_code = code_generator
      @total_attempts = ATTEMPTS
      @hints = HINTS
      @hints_used = 0
      # @input_code = '3233'
      # @result_of_an_attempt = find_cows_and_bulls
      @result_of_the_game = 0
      @result = ''
    end

    def new_game
      puts 'Start new game!'
      code_generator
      puts 'Code generator completed!'
      code_view_with_hint
      puts 'Code_view_with_hint completed!'
      data_checking
      find_cows_and_bulls
    end
    
    def validate_turn(input_code)
      puts "Validate_turn this = #{input_code.class}"
      data_checking input_code
      puts 'Data checking completed!'
      find_cows_and_bulls input_code
      puts 'Gets input_code to find_cows_and_bulls!'
      @total_attempts -= 1
      @result
    end

    def inbound_processing(input_code)
      data_checking(input_code)
      @attempts -= 1
    end

    
    private

    def code_generator
      (1..4).map { rand(1..6) }.join
    end

    def code_view_with_hint
      puts(@secret_code.slice(0, @hints_used) <<
      @secret_code.slice(@hints_used, @secret_code.size).tr(@secret_code, '*'))
    end

    def data_checking(input_code)
      raise ArgumentError, 'Type only integers from 1 to 6' if input_code =~ /[^0-6]/
      # raise ArgumentError, 'Type exactly 4 integer' unless input_code.length == 4
    end

    def find_cows_and_bulls(input_code)
      # p "Secret code = #{@secret_code.chars}"
      # puts input_code
      input_code.each_char.with_index do |elem, i|
        @result << if @secret_code.include?(elem)
          if input_code[i] == @secret_code[i]
            '+'
          else
            '-'
          end
        else
          ' '
        end
      end
      p "Result seching = [#{@result}]"
    end
  end
end
# Codebreaker::Game.new