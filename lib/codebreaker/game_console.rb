module Codebreaker
  # Interface for console game 'Codebreacker''
  class GameConsole
    def initialize(game = Codebreaker::Game.new)
      @game = game
      @path = PATH_TO_LOG_FILES
    end

    def start_game
      show_congrats
      play_session
    end

    def play_session
      case user_input = input_data
      when 'rules' then show_rules
      when 'hint' then give_hint
      else
        show result_on_input_data user_input
      end
    end

    def show(str)
      puts str
    end

    def result_on_input_data(input_data)
      @game.validate_turn input_data
    rescue ArgumentError => err
      err = 'ArgumentError message'
      #err.message
    end

    def input_data
      gets.chomp.downcase
    end

    def give_hint
      puts 'Give hint'
    end

    def show_congrats
      show GREETING_MESSAGE
    end

    def show_rules
      show RULES
    end
  end
end
