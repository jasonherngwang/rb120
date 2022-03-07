require 'pry'

class Board
  WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                  [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # cols
                  [[1, 5, 9], [3, 5, 7]]              # diagonals

  def initialize
    @squares = {}
    reset
  end

  def []=(num, marker)
    squares[num].marker = marker
  end

  def unmarked_keys
    squares.select { |_, square| square.unmarked? }.keys
  end

  def full?
    unmarked_keys.empty?
  end

  def someone_won?
    !!winning_marker
  end

  def winning_marker
    WINNING_LINES.each do |line|
      line_squares = squares.values_at(*line)
      if three_identical_markers?(line_squares)
        return line_squares.first.marker
      end
    end
    nil
  end

  def line_almost_full?(line, marker)
    line_markers = squares.values_at(*line).map(&:marker)
    line_markers.count(marker) == 2 &&
      line_markers.count(Square::INITIAL_MARKER) == 1
  end

  def find_square_to_complete_line(marker)
    square = nil
    WINNING_LINES.each do |line|
      if line_almost_full?(line, marker)
        square = line.select do |sq|
          squares[sq].marker == Square::INITIAL_MARKER
        end.first
        break
      end
    end
    square
  end

  def find_at_risk_square(opponent_marker)
    find_square_to_complete_line(opponent_marker)
  end

  def find_winning_square(own_marker)
    find_square_to_complete_line(own_marker)
  end

  def center_square_if_available
    unmarked_keys.include?(5) ? 5 : nil
  end

  def reset
    (1..9).each { |key| squares[key] = Square.new }
  end

  # rubocop:disable Metrics/AbcSize
  # rubocop:disable Metrics/MethodLength
  def draw
    square_width = 5
    border = (['+'] * 4).join('-' * square_width)
    empty_row = (['|'] * 4).join(' ' * square_width)
    row = "|  %s  |  %s  |  %s  |"

    puts [
      border,
      empty_row,
      row % [1, 2, 3].map { |i| squares[i] },
      empty_row,
      border,
      empty_row,
      row % [4, 5, 6].map { |i| squares[i] },
      empty_row,
      border,
      empty_row,
      row % [7, 8, 9].map { |i| squares[i] },
      empty_row,
      border
    ]
  end
  # rubocop:enable Metrics/AbcSize
  # rubocop:enable Metrics/MethodLength

  private

  attr_reader :squares

  def three_identical_markers?(squares)
    markers = squares.select(&:marked?).map(&:marker)
    return false if markers.size != 3
    markers.min == markers.max
  end
end

class Square
  INITIAL_MARKER = ' '

  attr_accessor :marker

  def initialize(marker=INITIAL_MARKER)
    @marker = marker
  end

  def marked?
    marker != INITIAL_MARKER
  end

  def unmarked?
    marker == INITIAL_MARKER
  end

  def to_s
    @marker
  end
end

class Player
  attr_reader :name, :marker

  def initialize
    @name = nil
    @marker = nil
  end
end

class Human < Player
  def choose_name
    choice = nil
    loop do
      puts "What's your name?"
      choice = gets.chomp
      break unless choice.strip.empty?
      puts "Invalid input."
    end
    @name = choice
  end

  def choose_marker
    choice = nil
    loop do
      puts "Choose any letter (A-Z, a-z) as your marker:"
      choice = gets.chomp
      break if ("A".."Z").include?(choice.upcase)
      puts "Invalid input."
    end
    @marker = choice
  end
end

class Computer < Player
  def initialize
    @name = "TARS"
    @marker = "+"
  end
end

class Scores
  WINNING_SCORE = 2

  def initialize(markers_arr)
    @scores = {}
    markers_arr.each { |marker| @scores[marker] = 0 }
  end

  def [](marker)
    scores[marker]
  end

  def increment(marker)
    scores[marker] += 1
  end

  def winning_marker
    scores.key(WINNING_SCORE)
  end

  def reset
    self.scores = scores.keys.map { |marker| [marker, 0] }.to_h
  end

  private

  attr_accessor :scores
end

class TTTGame
  attr_reader :board, :human, :computer, :scores

  def initialize
    @board = Board.new
    @human = Human.new
    @computer = Computer.new
    @starting_marker = nil
    @current_marker = nil
  end

  def player_move
    loop do
      current_player_moves
      break if board.someone_won? || board.full?
      clear_screen_and_display_board if human_turn?
    end
  end

  # rubocop:disable Metrics/MethodLength
  def play_match
    loop do
      display_board
      player_move
      display_result
      update_scores
      display_scores
      switch_starting_player
      break if match_over?
      display_next_round
      reset_board
    end
  end
  # rubocop:enable Metrics/MethodLength

  def main_game
    loop do
      select_first_player
      play_match
      display_match_winner
      break unless play_again?
      reset_board
      reset_scores
      display_play_again_message
    end
  end

  def play
    clear
    display_welcome_message
    choose_human_name
    choose_human_marker
    initialize_scores
    main_game
    display_goodbye_message
  end

  private

  attr_accessor :current_marker, :starting_marker

  def clear
    system "clear"
  end

  def display_welcome_message
    puts <<~WELCOME
    Welcome to Tic Tac Toe!
    Take turns marking a square. Three in a row wins!

    WELCOME
  end

  def choose_human_name
    human.choose_name
  end

  def choose_human_marker
    human.choose_marker
  end

  def initialize_scores
    @scores = Scores.new([human.marker, computer.marker])
  end

  def query_first_player
    answer = nil
    loop do
      answer = gets.chomp
      break if %w(1 2 3).include?(answer)
      puts "Invalid input. Choose 1, 2, or 3."
    end
    answer
  end

  # rubocop:disable Metrics/AbcSize
  # rubocop:disable Metrics/MethodLength
  def select_first_player
    puts "Who should go first? Enter 1, 2, or 3."
    puts "1) #{human.name}"
    puts "2) #{computer.name}"
    puts "3) Let #{computer.name} choose."
    puts

    answer = query_first_player

    self.current_marker = case answer
                          when '1' then human.marker
                          when '2' then computer.marker
                          else          [human.marker, computer.marker].sample
                          end
    self.starting_marker = current_marker
  end
  # rubocop:enable Metrics/AbcSize
  # rubocop:enable Metrics/MethodLength

  def update_scores
    scores.increment(board.winning_marker) if board.winning_marker
  end

  def match_over?
    !!scores.winning_marker
  end

  def display_match_winner
    case scores.winning_marker
    when human.marker    then puts "You won the match!"
    when computer.marker then puts "Computer won the match..."
    else                      puts "It's a tie."
    end
  end

  def display_scores
    puts "Score - You: #{scores[human.marker]}. "\
         "Computer: #{scores[computer.marker]}."
  end

  def display_board
    puts "You are: #{human.marker}. Computer is: #{computer.marker}."
    puts
    board.draw
    puts
  end

  def clear_screen_and_display_board
    clear
    display_board
  end

  def display_result
    clear_screen_and_display_board

    case board.winning_marker
    when human.marker    then puts "You won this round!"
    when computer.marker then puts "Computer won this round..."
    else                      puts "It's a tie."
    end
  end

  def display_next_round
    puts "Press any key to start the next round."
    gets
  end

  def joinor(arr, delimiter=', ', last_separator='or')
    if arr.size <= 2
      arr.join(" #{last_separator} ")
    else
      arr[0..-2].join(delimiter.to_s) +
        "#{delimiter}#{last_separator} " +
        arr[-1].to_s
    end
  end

  def human_moves
    available_squares = joinor(board.unmarked_keys)
    puts "Choose a square: #{available_squares}"
    square = nil
    loop do
      square = gets.chomp.to_i
      break if board.unmarked_keys.include?(square)
      puts "Invalid entry. Choices are: #{available_squares}"
    end

    board[square] = human.marker
  end

  def computer_moves
    square = board.find_winning_square(computer.marker) ||
             board.find_at_risk_square(human.marker) ||
             board.center_square_if_available ||
             board.unmarked_keys.sample
    board[square] = computer.marker
  end

  def play_again?
    answer = nil
    loop do
      puts "Play again? (y/n)"
      answer = gets.chomp
      break if %w(Y y N n).include? answer
      puts "Invalid answer."
    end

    %w(Y y).include? answer
  end

  def display_goodbye_message
    puts "Thanks for playing. Goodbye!"
  end

  def reset_board
    board.reset
    clear
  end

  def reset_scores
    scores.reset
  end

  def display_play_again_message
    puts "Let's play again!"
    puts
  end

  def human_turn?
    current_marker == human.marker
  end

  def current_player_moves
    if human_turn?
      human_moves
      self.current_marker = computer.marker
    else
      computer_moves
      self.current_marker = human.marker
    end
  end

  def switch_starting_player
    self.starting_marker = if starting_marker == human.marker
                             computer.marker
                           else
                             human.marker
                           end

    self.current_marker = starting_marker
  end
end

game = TTTGame.new
game.play
