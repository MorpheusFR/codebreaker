require 'yaml'
module Codebreaker
  # Interface for console game 'Codebreacker''
  class GameConsole
    def initialize #(game = Codebreaker::Game.new)
      @game = Codebreaker::Game.new #game
      @path_to_file = PATH_TO_LOG_FILES
      @status = false
    end

    def start_game
      show_congrats
      initialize
      play_session
    end

    def play_session
      # show_statistic
      until @game.total_attempts.zero?
        show_statistic
        case user_input = input_data
        when 'rules' then show_rules
        when 'hint' then @game.get_a_hint
        else show result_on_input_data user_input
        end
        break if @game.winner? || @game.hints.zero?
      end

      @game.winner? ? the_view_for_the_winner : the_view_for_the_loser
    end

    def show_statistic
      puts "Play session - turn #{@game.turn}".center(60)
      puts "Total attepts = (#{@game.total_attempts})".center(60)
      show LINE
      puts "Secret code (decorate)  = [#{@game.code_view_with_hint}]".center(60)
      puts "Result (hit statistics) = [#{@game.match_result}]".center(60)
      puts "Try to break the code 'input code' or ask for a 'hint'(#{@game.hints})".center(60)
      show LINE
    end

    def the_view_for_the_winner
      show WON
      @status = true
      finish_or_reset_game
    end

    def the_view_for_the_loser
      show THE_HINTS_ENDED
      puts "Secret code = [#{@game.code_view_with_hint}]"
      show LOOS
      finish_or_reset_game
    end

    def finish_or_reset_game
      save_result
      puts "You a ready restart game? (y/n)"
      start_game if input_data == 'y'
    end

    def save_result
      File.open(@path_to_file, 'a') do |f|
        f.puts get_data_to_save_statistic
      end
      # File.write(PATH_TO_LOG_FILES, log.to_yaml)
    end

    def get_data_to_save_statistic
      user_name = get_user_name
      game_result = @status ? 'Win' : 'Loos'
      session_statistic = @game.turn_statistic
      log = { user_name.to_s => [
                                session_statistic, 
                                'hints_get' => @game.hints, 
                                'Status of game' => game_result
                                ] }
      #p log
    end

    def get_user_name
      p "Enter your name: "
      gets.chomp
    end

    def show(str)
      puts str
    end

    def result_on_input_data(input_data)
      @game.validate_turn input_data
    rescue ArgumentError => err
      err = 'ArgumentError message: invalid value, try retrying!'
    end

    def input_data
      gets.chomp.downcase
    end

    def show_congrats
      show GREETING_MESSAGE
    end

    def show_rules
      show RULES
    end
  end
end
