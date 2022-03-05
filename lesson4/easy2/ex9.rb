=begin
What would happen if we added a play method to the Bingo class, keeping in mind 
that there is already a method of this name in the Game class that the Bingo 
class inherits from.

It overrides the play instance method inherited from the Game superclass.
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

  def play
    "BIIIIIINGOOOOO"
  end
end

p Bingo.new.play