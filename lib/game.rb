# game.rb
# frozen_string_literal: true

require_relative 'board'
require_relative 'players'

# Game setup.
class Game
  attr_accessor :player_one, :player_two, :board

  def initialize
    setup_game
  end

  # rubocop: disable Metrics
  def start_game
    loop do
      board.display
      player_move(@current_player)
      if board.game_over?(@current_player.symbol)
        board.display
        puts "#{@current_player.name} won!"
        play_again?
        break
      elsif board.full_board?
        board.display
        puts 'That\'s a draw!'
        play_again?
        break
      end
      switch_players
    end
  end
  # rubocop: enable Metrics

  private

  def setup_game
    @player_one = current_player('Player 1', 'X')
    @player_two = current_player('Player 2', 'O')
    @board = Board.new
    @current_player = player_one
  end

  def current_player(default_name, symbol)
    puts 'Enter players name:'
    name = gets.chomp
    name = default_name if name.strip.empty?
    Players.new(name, symbol)
  end

  def player_move(players)
    loop do
      puts "#{players.name} (#{players.symbol}) enter a position 1-9"
      input = gets.chomp
      exit_game if input.downcase == 'exit'

      number = input.to_i
      break if board.place_symbol(number, players.symbol)

      puts 'Invalid move. Pick a cell with a number'
    end
  end

  def switch_players
    @current_player = @current_player == player_one ? player_two : player_one
  end

  def play_again?
    puts 'Do you want to play again? Type either: yes or no.'
    answer = gets.chomp.downcase
    if answer == 'yes'
      setup_game
      start_game
    else
      puts 'Thank you for playing.'
      exit
    end
  end

  def exit_game
    puts 'Thank you for playing.'
    exit
  end
end
