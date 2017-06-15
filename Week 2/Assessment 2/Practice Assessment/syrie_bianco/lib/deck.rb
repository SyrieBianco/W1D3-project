require_relative 'card'

# Represents a deck of playing cards.
class Deck
  # Returns an array of all 52 playing cards.
  SUITS = Card::SUIT_STRINGS.keys
  VALUES = Card::VALUE_STRINGS.keys

  def self.all_cards
    cards = []
    SUITS.each do |suit|
      VALUES.each do |value|
        cards << Card.new(suit, value)
      end
    end
    cards
  end

  def initialize(cards = Deck.all_cards)
    @cards = cards
  end

  # Returns the number of cards in the deck.
  def count
    @cards.length
  end

  # Takes `n` cards from the top of the deck.
  def take(n)
    draw = []
    raise "not enough cards" if n>count
    until draw.length == n
      draw << @cards.shift
    end
    draw
  end

  # Returns an array of cards to the bottom of the deck.
  def return(cards)
    @cards.concat(cards)
  end
end
