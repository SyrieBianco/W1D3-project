require_relative './ai_player'

class Game
  # ::deal_in_players is a factory method that:
  # 1) Takes in an array of cards
  # 2) deals cards in an alternating pattern & creates 2 AIPlayers
  # 3) return instance of Game

  def self.deal_in_players(deck = Card.all_cards)
    deck
    hand1 = []
    hand2 = []
    until deck.empty?
      hand1 << deck.pop
      hand2 << deck.pop
    end
    player1 = AIPlayer.new(hand1)
    player2 = AIPlayer.new(hand2)
    Game.new(player1, player2)
  end

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
  end

  # call do_battle until game is over
  def play
    do_battle until game_over?
  end

  # 1. Players each take their top card
  # 2. If the cards' rank is the same, first, take an additional card
  #    prisoner from each player. Then, repeat #do_battle.
  # 3. If the last drawn cards are different ranks, all the cards drawn in
  #    this round are awarded to the drawer of the higher ranked card.
  def do_battle(prisoners = [])

    p1card, p2card = @player1.take_card, @player2.take_card
    prisoners << p1card
    prisoners << p2card

  rescue OutOfCardsError
    winner = @player2 if @player1.out_of_cards?
    winner = @player1 if @player2.out_of_cards?

    puts "game_over, #{winner} is the winner!"


    spaceship = p1card <=> p2card

    if spaceship == -1
      @player1.give_won_cards(prisoners)
    elsif spaceship == 1
      @player2.give_won_cards(prisoners)
    else
      pow1, pow2 =  @player1.take_card, @player2.take_card
      prisoners << pow1
      prisoners << pow2
      do_battle(prisoners)
    end

  end

  # if either of the players has run out of cards, the game is over
  def game_over?
    @player1.out_of_cards? || @player2.out_of_cards?
  end
end
