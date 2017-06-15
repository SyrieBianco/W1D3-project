class Hand
  # This is called a *factory method*; it's a *class method* that
  # takes the `Deck` and creates and returns a `Hand`
  # object. This is in contrast to the `#initialize` method that
  # expects an `Array` of cards to hold.
  def self.deal_from(deck)
    Hand.new(deck.take(2))
  end

  attr_accessor :cards

  def initialize(cards)
    @cards = cards
  end



  def points
    sum = 0
    aces = 0

    @cards.each do |card|
      card.value == :ace ? aces += 1 : sum += card.blackjack_value
    end

    ace_value = ((sum + aces) <= 11 ? (aces + 10) : aces)

    aces.zero? ? sum : sum + ace_value
  end






  def busted?
    points > 21
  end

  def hit(deck)
    raise "already busted" if busted?
    @cards += deck.take(1)
  end

  def beats?(other_hand)
    return false if busted?
    other_hand.busted? ? true : points > other_hand.points
  end

  def return_cards(deck)
    deck.return(@cards)
    @cards = []
  end

  def to_s
    @cards.join(",") + " (#{points})"
  end
end
