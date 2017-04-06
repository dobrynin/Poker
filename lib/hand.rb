class Hand
  attr_reader :cards

  def initialize
    @cards = []
    @discarded_counter = 0
  end

  def add_card(card)
    if @cards.size >= 5
      raise HandFullError
    else
      @cards << card
    end
  end

  def discard(value, suit)
    raise DiscardError if @discarded_counter >= 3
    @cards.reject! do |card|
      card.value == value && card.suit == suit
    end
    raise NoCardError if @cards.size == 5
    @discarded_counter += 1
  end


end

class HandFullError < StandardError
end

class NoCardError < StandardError
end

class DiscardError < StandardError
end
