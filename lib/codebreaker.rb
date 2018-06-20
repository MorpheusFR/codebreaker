#!/usr/bin/ruby
require_relative 'codebreaker/version'
# Comment to rubocop
module Codebreaker
  # Comment to rubocop
  class Game
    def initialize
      @secret_code = code_generator
      @total_attempts = 6
      @hint = 4
      @hints_used = 0
      @input_code = '3214'
      @result_of_an_attempt = find_cows_and_bulls
      @result_of_the_game = 0
    end

    def new_game
      code_generator
      code_view_with_hint
      find_cows_and_bulls
      info
    end

    def code_generator
      (1..4).map { rand(1..6) }.join
    end

    def code_view_with_hint
      puts(@secret_code.slice(0, @hints_used) <<
      @secret_code.slice(@hints_used, @secret_code.size).tr(@secret_code, '*'))
    end

    def info
      p @secret_code.chars
      p @input_code.chars
    end

    def find_cows_and_bulls
      @result = ''
      @input_code.chars.each do |elem|
        @result << if @secret_code.slice(elem)
          if @input_code.index(elem) == @secret_code.index(elem)
            '+'
          else
            '-'
          end
        else
          ' '
        end
      end
      p @result
      p @secret_code.chars
      p @input_code.chars
    end
  end
end

Codebreaker::Game.new
