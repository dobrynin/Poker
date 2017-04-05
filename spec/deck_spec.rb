require 'rspec'
require 'deck'

describe Deck do
  subject(:deck) { Deck.new }

  it 'contains 52 unique cards when created' do
    all_cards = true
    card_hash = Hash.new(0)
    deck.cards.each do |card|
      all_cards = false unless card.is_a? Card
      card_hash[[card.value, card.suit]] += 1
    end
    expect(all_cards).to be true
    expect(card_hash.all? { |_, v| v == 1 })
  end

  describe '#deal' do
    it 'deals a card' do
      expect(deck.deal).to be_an Card
    end
  end

end
