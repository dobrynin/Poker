require 'rspec'
require 'card'

describe Card do
  subject(:card) { Card.new('A', 'S') }

  it 'stores its suit' do
    expect(card.suit).to eq('S')
  end

  it 'stores its value' do
    expect(card.value).to eq('A')
  end
end
