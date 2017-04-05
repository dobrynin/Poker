require_relative 'card'

class Deck
  attr_reader :cards

  def initialize
    @cards = create_deck
  end

  def deal
    @cards.pop
  end

  private

  def create_deck
    cards = []
    values = %w(A 2 3 4 5 6 7 8 9 10 J Q K)
    suits = %w(C D H S)
    values.each do |value|
      suits.each do |suit|
        cards << Card.new(value, suit)
      end
    end

    cards.shuffle
  end
end
