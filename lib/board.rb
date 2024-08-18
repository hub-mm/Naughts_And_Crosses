# board.rb
# frozen_string_literal: true

# Board setup.
class Board
  attr_reader :cells

  def initialize
    @cells = [1, 2, 3, 4, 5, 6, 7, 8, 9]
  end

  # rubocop: disable Metrics/AbcSize
  def display
    puts "\n #{cells[0]} | #{cells[1]} | #{cells[2]}"
    puts '---+---+---'
    puts " #{cells[3]} | #{cells[4]} | #{cells[5]}"
    puts '---+---+---'
    puts " #{cells[6]} | #{cells[7]} | #{cells[8]} \n\n"
  end
  # rubocop: enable Metrics/AbcSize

  def update_board(number, symbol)
    @cells[number - 1] = symbol
  end
end
