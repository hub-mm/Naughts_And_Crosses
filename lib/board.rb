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

  def place_symbol(number, symbol)
    if @cells[number - 1].is_a?(Integer)
      update_board(number, symbol)
      true
    else
      puts 'This cell is already taken, choose another spot.'
      false
    end
  end

  def full_board?
    cells.none? { |cell| cell.is_a?(Integer) }
  end

  def game_over?(symbol)
    winning_logic.any? do |combo|
      combo.all? { |index| cells[index] == symbol }
    end
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

  def winning_logic
    [
      [0, 1, 2], # Top row.
      [3, 4, 5], # Middle row.
      [6, 7, 8], # Bottom row.
      [0, 3, 6], # Left column.
      [1, 4, 7], # Middle column.
      [2, 5, 8], # Right column.
      [0, 4, 8], # Left diagonal.
      [2, 4, 6] # Right diagonal.
    ]
  end
end
