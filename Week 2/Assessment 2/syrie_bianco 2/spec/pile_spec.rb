require 'rspec'
require 'card'
require 'pile'

describe Pile do
  describe '#take_card' do
    it "raises an OutOfCardsError error when called on an empty pile" do
      expect do
        pile = Pile.new([])
        pile.take_card
      end.to raise_error OutOfCardsError
    end

    it "returns the top(last) card in the Pile" do
      eight_of_clubs = Card.new(:clubs, :eight)
      ten_of_hearts = Card.new(:hearts, :ten)
      pile = Pile.new([eight_of_clubs, ten_of_hearts])
      expect(pile.take_card).to eq(ten_of_hearts)
      expect(pile.take_card).to eq(eight_of_clubs)
    end
  end

  describe "#empty?" do
    it "detects when the pile is empty" do
      expect(Pile.new([])).to be_empty
    end

    it "detects when the pile is NOT empty" do
      pile = Pile.new([Card.new(:clubs, :eight)])
      expect(pile).to_not be_empty
    end

    it "taking the last card causes the deck to become empty" do
      pile = Pile.new([Card.new(:clubs, :eight)])
      expect(pile).to_not be_empty
      pile.take_card
      expect(pile).to be_empty
    end
  end

  describe "#add_cards" do
    let(:pile) { Pile.new([]) }
    let(:cards) { [Card.new(:spades, :deuce), Card.new(:hearts, :ace)] }

    it "adds new cards to the bottom(beginning) of the Pile" do
      pile.add_cards(cards.first)
      pile.add_cards([Card.new(:clubs, :jack)])
      expect(pile.take_card).to eq(cards.first)
    end

    it "adds cards in correct order" do
      pile.add_cards(cards)
      expect(pile.take_card).to eq(cards.last)
      expect(pile.take_card).to eq(cards.first)
    end
  end
end
