require 'rspec'
require 'card'
require 'pile'
require 'ai_player'

describe AIPlayer do
  let(:cards) do
    [Card.new(:hearts, :five),
     Card.new(:diamonds, :four),
     Card.new(:hearts, :four)]
  end

  let(:player) { AIPlayer.new(cards.dup) }

  describe '#initialize' do
    it "takes an array of cards to create the player's '@pile' ivar" do
      expect(player.instance_variable_get(:@pile)).to be_instance_of(Pile)
    end

    it "doesn't expose the pile using accessor methods" do
      expect(player).to_not respond_to(:pile)
      expect(player).to_not respond_to(:pile=)
    end
  end

  describe '#take_card' do
    it "returns the top card on the player's pile" do
      2.downto(0) do |idx|
        expect(player.take_card).to eq(cards[idx])
      end
    end

    it "throws an OutOfCardsError when the pile is empty" do
      expect do
        4.times { player.take_card }
      end.to raise_error(OutOfCardsError)
    end
  end

  let(:empty_player) { AIPlayer.new([]) }

  describe "#give_won_cards" do
    it "puts the cards into the player's pile" do
      expect { empty_player.take_card }.to raise_error(OutOfCardsError)
      empty_player.give_won_cards([Card.new(:hearts, :nine)])
      expect { empty_player.take_card }.to_not raise_error
    end

    it "places the cards into the bottom of the player's pile" do
      empty_player.give_won_cards([Card.new(:hearts, :nine)])
      empty_player.give_won_cards([Card.new(:spades, :ace)])
      expect(empty_player.take_card).to eq(Card.new(:hearts, :nine))
    end
  end

  describe "#out_of_cards?" do
    it "returns false when the pile is not empty" do
      expect(player).to_not be_out_of_cards
    end

    it "returns true when the pile is empty" do
      expect(empty_player).to be_out_of_cards
    end
  end
end
