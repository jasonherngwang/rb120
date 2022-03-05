=begin
What can we add to Bingo so it inherits the play method from Game?

Bingo < Game
=end

class Game
  def play
    "Start the game!"
  end
end

class Bingo < Game
  def rules_of_play
    #rules of play
  end
end

puts Bingo.new.play