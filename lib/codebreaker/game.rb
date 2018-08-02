module Codebreaker
  # Module Game - logic
  class Game
    attr_reader :hints, :hints_used, :total_attempts, :match_result, :turn, :turn_statistic

    def initialize
      @secret_code = code_generator
      @total_attempts = ATTEMPTS
      @hints = HINTS
      @hints_used = 0
      @match_result = ''
      @turn = 1
      @turn_statistic = {}
    end

    def validate_turn(input_code)
      data_checking input_code
      find_cows_and_bulls input_code
      counter_attepmpts_and_turn
    end

    def counter_attepmpts_and_turn
      @total_attempts -= 1
      GAME_TURN + "#{@turn += 1}"
    end

    def inbound_processing(input_code)
      data_checking input_code
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
      @turn_statistic[@turn] = input_code
      raise ArgumentError, 'Type only integers from 1 to 6' if input_code =~ /[^0-6]/
      raise ArgumentError, 'Type exactly 4 integer' unless input_code.length == 4
    end
  end
end
