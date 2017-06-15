class AIPlayer
  # keep a pile of cards
  def initialize(cards)
    @pile = Pile.new(cards)
  end

  # return the top card from the pile
  # raise an error if the pile is empty
  def take_card
    raise OutOfCardsError if @pile.empty?
    @pile.take_card
  end

  # add the cards to the bottom of the pile
  def give_won_cards(cards)
    @pile.add_cards(cards)
  end

  # returns true if pile is empty
  def out_of_cards?
    @pile.empty?
  end
end

class OutOfCardsError < StandardError

end
