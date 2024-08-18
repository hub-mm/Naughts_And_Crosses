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
      setup_board
      player_move
      if board.winning_logic
        board.display
        puts "#{current_player} won!"
        play_again
        break
      elsif board.full_board
        board.display
        puts 'That\'s a draw!'
        play_again
        break
      end
      switch_players
    end
  end
  # rubocop: enable Metrics
end
