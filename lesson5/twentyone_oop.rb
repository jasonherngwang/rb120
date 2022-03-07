module Hand
  SUIT_SYMBOLS = { 'H': "\u2665", 'D': "\u2666",
                   'C': "\u2663", 'S': "\u2660" }

  def hand_value
    total = @hand.reduce(0) do |sum, card|
      sum + card.value
    end

    total = correct_for_aces(@hand, total)
  end

  def add_card(card)
    @hand.push(card)
  end

  def display_hand(reveal_dealer: false)
    cards = @hand.map do |card|
      format("%2s%s", card.rank, SUIT_SYMBOLS[card.suit])
    end
    puts cards.join(' ')
    puts "Total: #{hand_value}"
  end

  def reset
    @hand = []
  end

  private

  def correct_for_aces(hand, total)
    if (total <= 11) && (@hand.any? { |card| card.rank == 'A' })
      total + 10
    else
      total
    end
  end
end

class Deck
  SUITS = [:H, :D, :C, :S]
  RANKS = [*('2'..'10'), 'J', 'Q', 'K', 'A']

  def initialize
    reset
  end

  def draw
    @deck.pop
  end

  def reset
    @deck = SUITS.product(RANKS).shuffle.map do |suit, rank|
      Card.new(suit, rank)
    end
  end
end

class Card
  attr_reader :suit, :rank

  CARD_VALUES = { '2' => 2, '3' => 3, '4' => 4, '5' => 5, '6' => 6, '7' => 7,
                  '8' => 8, '9' => 9, '10' => 10, 'J' => 10, 'Q' => 10,
                  'K' => 10, 'A' => 1 }

  def initialize(suit, rank)
    @suit = suit
    @rank = rank
  end
  
  def value
    CARD_VALUES[@rank]
  end
end

class Participant
  include Hand

  def initialize
    @hand = []
  end

  def busted?
    hand_value > 21
  end
end

class Player < Participant
  def query_hit_or_stay
    answer = nil
    loop do
      puts "Do you want to hit (h) or stay (s)?"
      answer = gets.chomp
      break if %w(h s).include?(answer.downcase)
      puts "Invalid input"
    end
    answer.downcase
  end
  
  def should_hit?
    query_hit_or_stay == 'h'
  end

  def display_hand
    print "Player hand:"
    super
  end
end

class Dealer < Participant
  def should_hit?
    hand_value <17
  end

  def display_hand
    print "Dealer hand:"
    super
  end
end

class Game
  def initialize
    @deck = Deck.new
    @player = Player.new
    @dealer = Dealer.new
  end
  
  def play
    # display_welcome_message

    loop do
      deal_initial_cards
      display_hands
      player_turn
      dealer_turn unless player.busted?
      display_winner
      break unless play_again?
      reset_cards
    end

    # display_goodbye_message
  end

  private

  attr_reader :player, :dealer

  def deal_card(participant)
    participant.add_card(@deck.draw)
  end

  def deal_initial_cards
    2.times do
      deal_card(player)
      deal_card(dealer)
    end
  end

  def display_hands
    player.display_hand
    dealer.display_hand
  end

  def player_turn
    loop do
      player.should_hit? ? deal_card(player) : break
      display_hands
      break if player.busted?
    end
  end

  def dealer_turn
    loop do
      dealer.should_hit? ? deal_card(dealer) : break
      display_hands
      break if dealer.busted?
    end
  end

  def determine_game_result
    player_total = player.hand_value
    dealer_total = dealer.hand_value

    if player.busted?
      :player_busted
    elsif dealer.busted?
      :dealer_busted
    elsif dealer_total < player_total
      :player
    elsif dealer_total > player_total
      :dealer
    else
      :tie
    end
  end

  def display_winner
    game_result = determine_game_result
    case game_result
    when :player_busted then puts "You busted!"
    when :dealer_busted then puts "Dealer busted!"
    when :player        then puts "You won!"
    when :dealer        then puts "Dealer won!"
    when :tie           then puts "It's a tie."
    end
  end

  def play_again?
    answer = ''
    loop do
      puts "Play again? (yes/no)"
      answer = gets.chomp.downcase
      return false if %w(n no).include? answer
      return true if %(y yes).include? answer
      puts "Invalid input."
    end
  end

  def reset_cards
    player.reset
    dealer.reset
    @deck.reset
  end
end

game = Game.new
game.play