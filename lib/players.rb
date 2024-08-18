# players.rb
# frozen_string_literal: true

# Create players and assign symbol to players.
class Players
  attr_accessor :name
  attr_reader :symbol

  def initialize(name, symbol)
    @name = name
    @symbol = symbol
  end
end
