# board.rb
# frozen_string_literal: true

require 'colorize'

# Board setup.
class Board
  attr_reader :cells

  def initialize
    @cells = [1, 2, 3, 4, 5, 6, 7, 8, 9]
  end

  # rubocop: disable Metrics/AbcSize
  def display
    puts "\n #{colorize(cells[0])} | #{colorize(cells[1])} | #{colorize(cells[2])}"
    puts '---+---+---'
    puts " #{colorize(cells[3])} | #{colorize(cells[4])} | #{colorize(cells[5])}"
    puts '---+---+---'
    puts " #{colorize(cells[6])} | #{colorize(cells[7])} | #{colorize(cells[8])} \n\n"
  end
  # rubocop: enable Metrics/AbcSize

  def update_board(number, symbol)
    @cells[number - 1] = symbol
  end

  def place_symbol(number)
    if @cells[number].is_a?(Integer)
      update_board
    else
      'This cell is already taken, choose another spot.'
    end
  end

  def full_board?
    @cells.none? { |cell| cell.is_a?(Integer) }
    puts 'That\'s a draw!'
  end

  private

  def colorize(cell)
    case cell
    when 'X'
      cell.colorize(:red)
    when 'O'
      cell.colorize(:blue)
    else
      cell.to_s
    end
  end
end

board = Board.new
puts board.display
