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
      until @game.total_attempts.zero?
        show_statistic
        case user_input = input_data
        when 'rules' then show_rules
        when 'hint' then @game.get_a_hint
        else show result_on_input_data user_input
        end
        break if @game.winner?
      end

      @game.winner ? the_view_for_the_winner : the_view_for_the_loser
    end

    def show_statistic
      puts "Play session".center(80)
      puts "Total attepts = (#{@game.total_attempts})".center(80)
      puts "................................................................................"
      puts "Secret code (decorate)  = [#{@game.code_view_with_hint}]".center(80)
      # puts "Input code (user input)= [#{input_code}]"
      puts "Result (hit statistics) = [#{@game.match_result}]".center(80)
      puts "Try to break the code 'input code' or ask for a 'hint'".center(80)
      puts "................................................................................"
    end

    def the_view_for_the_winner
      show WON
    end

    def the_view_for_the_loser
      show LOOS
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
      @path.hint
    end

    def show_congrats
      show GREETING_MESSAGE
    end

    def show_rules
      show RULES
    end
  end
end
