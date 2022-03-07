=begin
OOP Tic Tac Toe
Tic Tac Toe is a 2-player game played on a 3x3 grid. Players take turns marking 
a square. The first player to mark 3 squares in a row wins.

Noun: Player
- Play Game -----> Moved to TTTGame class
- Mark

Noun: Board (Grid)

Noun: Square
=end

# Spike

class Player
  def initialize
    # Player's name
    # Human or computer?
    # Person's symbol
  end

  def mark
  end
end

class Board
  def initialize
    # Initialize 9 Squares in a nested array
  end
end

class Square
  def initialize
    # Status: Marked or unmarked
  end
end

class TTTGame
  def play
    display_welcome_message
    initialize_player
    initialize_computer_player
    initialize_board
    loop do
      display_board
      player_turn
      break if game_over? || board_full?
      computer_turn
      break if game_over? || board_full?
    end
    display_winner
    display_goodbye_message
  end
end

game = TTTGame.new
game.play