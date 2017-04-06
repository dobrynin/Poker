require 'rspec'
require 'hand'

describe Hand do
  subject(:hand) { Hand.new }
  let(:ace) { double('Card', value: 'A', suit: 'S') }
  let(:king) { double('Card', value: 'K', suit: 'H') }
  let(:queen) { double('Card', value: 'Q', suit: 'C') }
  let(:jack) { double('Card', value: 'J', suit: 'D') }
  let(:ten) { double('Card', value: '10', suit: 'S') }
  let(:cards) { [ace, king, queen, jack, ten]}

  it 'is initialized with no cards' do
    expect(hand.cards.size).to eq(0)
  end

  describe '#add_card' do
    it 'accepts a card' do
      hand.add_card(ace)
      expect(hand.cards.include?(ace)).to be true
    end

    it 'does not accept a card when the hand is full' do
      cards = [ace, king, queen, jack, ten]
      cards.each { |card| hand.add_card(card) }
      expect { hand.add_card(ace) }.to raise_error(HandFullError)
    end
  end

  describe '#discard' do

    before(:each) do
      cards = [ace, king, queen, jack, ten]
      cards.each do |card|
        hand.add_card(card)
      end
    end

    it 'discards a card' do
      hand.discard(ace.value, ace.suit)
      expect(hand.cards.include?(ace)).to be false
    end

    it 'raises an error when discarding an invalid card' do
      expect { hand.discard('2', 'X') }.to raise_error(NoCardError)
    end

    it 'does not allow more than 3 discards' do

      3.times do
        card = cards.pop
        hand.discard(card.value, card.suit)
      end
      card = cards.pop
      expect { hand.discard(card.value, card.suit) }.to raise_error(DiscardError)
    end
  end

end
