require_relative 'codebreaker/version'
# Comment to rubocop
module Codebreaker
  # Comment to rubocop
  class Game
    def initialize
      new_game
      code_generator
      code_view_with_hint
      find_cows_and_bulls
    end

    def new_game
      @secret_code = code_generator
      @total_attempts = 6
      @hint = 4
      @hints_used = 0
      @input_code = '3214'
    end

    def code_generator
      (1..4).map { rand(1..6) }.join
    end

    def code_view_with_hint
      puts(@secret_code.slice(0, @hints_used) <<
      @secret_code.slice(@hints_used, @secret_code.size).tr(@secret_code, '*'))
    end

    def find_cows_and_bulls
      p _secret_code_array = @secret_code.chars
      p input_code_array = @input_code.chars
      input_code_array.each { |input_elem| p input_elem }
    end
  end
end

Codebreaker::Game.new
