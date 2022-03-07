=begin
OOP Twenty-One
Twenty-One is a 2-player card game. Each player is initially dealt 2 cards. 
Each player can choose to draw a new card (hit) or end their turn (stay). 
The value of each players card (their hand) is the sum of the rank values. 
An Ace can be worth 1 or 11. If the player's hand value exceeds 21, it is 
considered a bust, and the player loses. To win: 1) a player's hand value must 
exceed their opponent's at the end of the round, or 2) the opponent busts.
- The opponent (dealer) will hit unless his hand value <= 17.
- It is a tie if both hand values are equal, at the end of the round.

Noun: Deck
- Deal Card

Noun: Card
- Has suit
- Has rank/value

Noun: Participant
- Can be Player or Dealer

Noun: Player
- Hit
- Stay
- Busted?
- Total

Noun: Dealer
- Hit
- Stay
- Busted?
- Total

Noun: Game
- Play/start

Noun: Total (calculate hand value)

=end

# Spike

module Hand

end

class Deck
  def initialize
    # Create Array to store the Cards remaining in deck.
    # Initialize with 52 Cards and store in array
  end
end

class Card
  def initialize
    # Suit: Symbol
    # Rank: String 2-10, J, Q, K, A
  end
  
  def value
    # Value can be 1-11. Return Integer.
  end
end

class Participant
  def initialize
    # Hand: An Array of Cards
  end

  def hit
  end

  def stay
  end

  def busted?
    # Check if hand is busted.
  end

  def hand_value
    # Calculate hand value (Integer) based on Cards.
    # Special consideration for Ace.
  end
end

class Player < Participant

end

class Dealer < Participant

end

class Game
  def initialize

  end

  def deal_initial_cards

  end
  
  def play
    display_welcome_message
    initialize_player
    initialize_dealer
    # Game loop
    loop do
      # Play Round
      deal_initial_cards
      display_hands
      player_turn
      dealer_turn unless player.bust?
      display_round_winner
      break unless play_again?
      reset_hands
      reset_deck
    end
    display_goodbye_message
  end
end

game = Game.new
game.play