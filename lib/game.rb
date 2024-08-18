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
      player_move
      if board.winning_logic
        board.display
        puts "#{current_player} won!"
        play_again?
        break
      elsif board.full_board
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
    @player_one = create_player_one('Player 1', 'X')
    @player_two = create_player_two('Player 2', 'O')
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
      break if board.place_symbol(number, player.symbol)

      puts 'Invalid move. Pick a cell with a number'
    end
  end

  def switch_players
    @current_player = @current_player == player_one ? player_two : player_one
  end

  def play_again?
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
