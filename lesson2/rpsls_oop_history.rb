require 'pry'
class Move
  MOVES = %w(rock paper scissors lizard spock)

  def >(other_move)
    defeats.include?(other_move.value)
  end

  def <(other_move)
    other_move.defeats.include?(value)
  end

  def to_s
    value
  end

  protected

  attr_reader :value, :defeats
end

class Rock < Move
  def initialize
    @value = 'rock'
    @defeats = ['lizard', 'scissors']
  end
end

class Paper < Move
  def initialize
    @value = 'paper'
    @defeats = ['rock', 'spock']
  end
end

class Scissors < Move
  def initialize
    @value = 'scissors'
    @defeats = ['paper', 'lizard']
  end
end

class Lizard < Move
  def initialize
    @value = 'lizard'
    @defeats = ['spock', 'paper']
  end
end

class Spock < Move
  def initialize
    @value = 'spock'
    @defeats = ['scissors', 'rock']
  end
end

class Player
  attr_accessor :move, :name

  def initialize
    set_name
  end

  def to_s
    name
  end
end

class Human < Player
  def set_name
    n = ''
    loop do
      puts "What's your name?"
      n = gets.chomp
      break unless n.empty?
      puts "Sorry, must enter a value."
    end
    self.name = n
  end

  def choose
    choice = nil
    loop do
      puts "Please choose rock, paper, scissors, lizard, or spock:"
      choice = gets.chomp
      break if Move::MOVES.include? choice
      puts "Sorry, invalid choice."
    end
    self.move =
      case choice
      when 'rock'     then Rock.new
      when 'paper'    then Paper.new
      when 'scissors' then Scissors.new
      when 'lizard'   then Lizard.new
      when 'spock'    then Spock.new
      end
  end
end

class Computer < Player
  def choose
    random_choice = Move::MOVES.sample
    self.move =
      case random_choice
      when 'rock'     then Rock.new
      when 'paper'    then Paper.new
      when 'scissors' then Scissors.new
      when 'lizard'   then Lizard.new
      when 'spock'    then Spock.new
      end
  end
end

class R2D2 < Computer
  def choose
    self.move = Rock.new
  end

  def set_name
    self.name = 'R2D2'
  end
end

class HAL < Computer
  PROBABILITIES = {
    Rock     => 10,
    Paper    => 0,
    Scissors => 50,
    Lizard   => 20,
    Spock    => 20
  }

  def choose
    choices = PROBABILITIES.flat_map do |move, probability|
      [move] * probability
    end
    self.move = choices.sample.new
  end
  
  def set_name
    self.name = 'HAL'
  end
end

class Chappie < Computer
  PROBABILITIES = {
    Rock     => 5,
    Paper    => 80,
    Scissors => 5,
    Lizard   => 5,
    Spock    => 5
  }

  def choose
    choices = PROBABILITIES.flat_map do |move, probability|
      [move] * probability
    end
    self.move = choices.sample.new
  end

  def set_name
    self.name = 'Chappie'
  end
end

class Score
  WINNING_SCORE = 2

  def initialize(computer_name = 'Computer')
    @computer_name = computer_name
    reset
  end

  def reset
    @human = 0
    @computer = 0
  end

  def increment(player)
    self.human += 1 if player == :human
    self.computer += 1 if player == :computer
  end

  def game_over?
    human == WINNING_SCORE || computer == WINNING_SCORE
  end

  def game_winner
    human == WINNING_SCORE ? :human : :computer
  end

  def to_s
    "Score - Human: #{human}, #{computer_name}: #{computer}"
  end

  private

  attr_accessor :human, :computer, :computer_name
end

class MoveRecord
  def initialize(game, round, player, player_move, computer_player, computer_player_move, round_score)
    @game = game
    @round = round
    @player = player
    @player_move = player_move
    @computer = computer_player
    @computer_move = computer_player_move
    @score = round_score
  end

  def display
    puts "Game #{game}, Round #{round}. #{score}"
    puts "#{player} played #{player_move}. #{computer} played #{computer_move}."
  end

  private
  attr_reader :game, :round, :player, :player_move, :computer, :computer_move, :score
end

class History
  def initialize
    @history = []
  end

  def add_move(move_record)
    history << move_record
  end

  def display
    puts "Game History"
    puts "------------"
    history.each do |move_record|
      move_record.display
    end
  end

  private

  attr_reader :history
end

# Game Orchestration Engine
class RPSGame
  attr_accessor :human, :computer, :game_num, :round_num
  attr_reader :score, :game_history

  def initialize
    system "clear"
    @human = Human.new
    @computer = [R2D2, HAL, Chappie].sample.new
    @score = Score.new(computer_name = computer.name)
    @game_history = History.new
    @game_num = 1
    @round_num = 1
  end

  def display_welcome_message
    puts "Welcome to Rock, Paper, Scissors!"
    puts "First to #{Score::WINNING_SCORE} wins."
    puts "Press any key to continue."
    gets
    system "clear"
  end

  def display_goodbye_message
    puts "Thanks for playing Rock, Paper, Scissors. Goodbye!"
  end

  def display_moves
    puts "#{human.name} chose #{human.move}."
    puts "#{computer.name} chose #{computer.move}."
  end

  def display_score
    puts score
  end

  def update_score
    if human.move > computer.move
      score.increment(:human)
    elsif human.move < computer.move
      score.increment(:computer)
    end
  end

  def store_history
    move_record = MoveRecord.new(
      game = game_num,
      round = round_num,
      player = human,
      player_move = human.move,
      computer_player = computer,
      computer_player_move = computer.move,
      round_score = score.clone,
    )
    game_history.add_move(move_record)
  end

  def display_history
    game_history.display
  end

  def advance_round
    self.round_num += 1
  end

  def advance_game
    self.game_num += 1
  end

  def display_round_winner
    if human.move > computer.move
      puts "#{human.name} won the round!"
    elsif human.move < computer.move
      puts "#{computer.name} won the round!"
    else
      puts "It's a tie!"
    end
    puts
  end

  def display_game_winner
    winner = score.game_winner == :human ? human.name : computer.name
    puts "#{winner} won the game!"
    puts score
    puts
  end

  def play_again?
    answer = nil
    loop do
      puts "Would you like to play again? (y/n)"
      answer = gets.chomp
      break if ['y', 'n'].include? answer.downcase
      puts "Sorry, please enter y or n."
    end

    answer.downcase == 'y'
  end

  def play_game
    display_welcome_message
    loop do
      system "clear"
      score.reset
      loop do
        display_score
        play_round
        store_history
        break if score.game_over?
        advance_round
      end
      display_game_winner
      display_history
      break unless play_again?
      advance_game
      
    end
    display_goodbye_message
  end

  def play_round
    human.choose
    computer.choose
    display_moves
    display_round_winner
    update_score
  end
end

RPSGame.new.play_game
