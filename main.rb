# main.rb
# frozen_string_literal: true

require_relative 'lib/board'
require_relative 'lib/players'
require_relative 'lib/game'

game = Game.new
game.start_game
