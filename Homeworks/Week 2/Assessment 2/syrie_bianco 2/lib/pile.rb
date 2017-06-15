class Pile
  def initialize(cards)
    @cards = cards
  end

  # return the top (last) card and remove it from pile
  def take_card
    raise OutOfCardsError if empty?
    @cards.pop
  end

  # returns true if the pile is empty
  def empty?
    @cards.empty?
  end

  # add cards to the bottom (beginning) of pile
  def add_cards(new_cards)
    @cards.unshift(*new_cards)
  end

end


class OutOfCardsError < StandardError

end
