require 'rspec'
require '../lib/card'
require '../lib/deck'
require '../lib/player'

describe Player do
  it 'player setup' do
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:space, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    deck = Deck.new([card1, card2, card3])
    player = Player.new('Clarisa', deck)

    expect(player).to be_an_instance_of(Player)
    expect(player.name).to eq('Clarisa')
    expect(player.deck).to eq(deck)
  end

  it 'has lost?' do
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:space, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    deck = Deck.new([card1, card2, card3])
    player = Player.new('Clarisa', deck)
    
    expect(player.has_lost?).to be false
    expect(player.deck.remove_card).to eq(card1)
    expect(player.has_lost?).to be false
    expect(player.deck.remove_card).to eq(card2)
    expect(player.has_lost?).to be false
    expect(player.deck.remove_card).to eq(card3)
    expect(player.has_lost?).to be true
    expect(player.deck).to eq(deck)
  end
end