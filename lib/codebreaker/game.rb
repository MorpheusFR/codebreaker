module Codebreaker
  # Comment to rubocop
  class Game
    attr_reader :input_code, :hints, :total_attempts, :match_result

    def initialize
      @secret_code = code_generator
      @total_attempts = ATTEMPTS
      @hints = HINTS
      @hints_used = 0
      @match_result = ''
    end

    # def new_game
    #   puts 'Start new game!'
    #   code_generator
    #   puts 'Code generator completed!'
    #   code_view_with_hint
    #   puts 'Code_view_with_hint completed!'
    #   data_checking
    #   find_cows_and_bulls
    # end

    def validate_turn(input_code)
      data_checking input_code
      find_cows_and_bulls input_code
      # puts "Total attepts (prew)   = (#{@total_attempts})"
      @total_attempts -= 1
      # puts "Total attepts (next)   = (#{@total_attempts})"
      # puts "Secret code            = [#{@secret_code}]"
      # puts "Secret code (decorate) = [#{code_view_with_hint}]"
      puts "Input code (user input)= [#{input_code}]"
      # puts "Result                 = [#{@match_result}]"
    end

    def inbound_processing(input_code)
      data_checking(input_code)
      @attempts -= 1
    end

    def winner?
      @match_result == '++++'
    end

    def get_a_hint
      @hints -= 1
      @hints_used += 1
    end

    def code_view_with_hint
      @secret_code.slice(0, @hints_used) <<
      @secret_code.slice(@hints_used, @secret_code.size).tr(@secret_code, '*')
    end

    private

    def code_generator
      (1..4).map { rand(1..6) }.join
    end

    def find_cows_and_bulls(input_code)
      @match_result = ''
      input_code.each_char.with_index do |elem, i|
        @match_result << if @secret_code.include?(elem)
          if input_code[i] == @secret_code[i]
            '+'
          else
            '-'
          end
        else
          ' '
        end
      end
    end

    def data_checking(input_code)
      raise ArgumentError, 'Type only integers from 1 to 6' if input_code =~ /[^0-6]/
      raise ArgumentError, 'Type exactly 4 integer' unless input_code.length == 4
    end
  end
end
