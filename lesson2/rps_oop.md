# OOP Rock Paper Scissors

Steps of OOP:

1. Organize and modularize code into classes.
2. Use objects to orchestrate program flow.

## Textual Description

Rock, Paper, Scissors is a 2-player games where each player chooses 1 of 3 possible moves: rock, paper, or scissors. The chosen moves will be compared to see who wins, according to the following rules:

- Rock beats Scissors
- Scissors beats Paper
- Paper beats Rock

If the players chose the same move, it's a Tie.

## Nouns and Verbs
1. Identify Major Nouns and Verbs
2. Organize and Associate Verbs with Nouns
3. Nouns are Classes, Verbs are Behaviors or Methods
4. Do a spike to explore the problem
5. Model your thoughts into CRC Cards

Noun: Player (Player 1, Player 2)
  - Verb: Choose Move

Noun: Move (Rock, Paper, or Scissors)

Noun: Rule (3 total)

Noun: Game Master???
  - Verb: Compare Moves

## Design Choice 1

Create subclasses `Human` and `Computer` which inherit from `Player`. Subclasses should implement their own version of `set_name` and `choose`. This is an improvement because it simplifies the logic and removes the `is human?` conditional expression. Only the common general logic remains in the superclass. The `player_type` attribute is no longer necessary.

This code demonstrates polymorphism because `Player` and `Computer` respond to the same methods `set_name` and `choose` in different ways.

The drawback is that there are more classes to keep track of.

## Design Choice 2

The `case` statement does not belong in the `display_winner` method and should be extracted into its own method.

Turn instance variable `move` into a custom object so that its possible values (`'rock'`, `'paper'`, `'scissors'`) can be compared with each other using comparison operators.

Create predicate methods `rock?`, `paper?`, `scissors?` to compare move values.

Create `to_s` method to return a string representation of `Move` objects.

Primary improvement: Creating a `Move` class makes the logic of comparing moves more readable. It would be easier to add other types of moves.

Primary drawback: The amount of code increases. Since `Move` objects are now collaborator objects of `Human` and `Computer`, this increases the level of indirection and potentially complexity.


# Bonus Features

## Keeping score

Right now, the game doesn't have very much dramatic flair. It'll be more interesting if we were playing up to, say, 10 points. Whoever reaches 10 points first wins. Can you build this functionality? We have a new noun -- a score. Is that a new class, or a state of an existing class? You can explore both options and see which one works better.

Noun: Score

Verbs:
- Increment score
- Check if winner

Score should be checked after `display_winner` (round winner) to determine if there is a game winner. The play again check should be moved out of the loop, potentially into another surrounding loop.

Make Score a new class in order to separate its logic from the `RPSGame` class. Score could also be store in the player classes, but it is not an inherent attribute of a player. Rather, it belongs to the game.
- Score data can be stored in instance variables `:human` and `:computer`, initialized to `0` at the start of the game. There should be a method to `reset` the scores to zero if the player wishes to start a new game.
- `increment(player)` is performed after each round, to update the score.
- `game_over?` returns a boolean indicating if either player has reached the winning score.
- `game_winner` returns a Symbol (`:human` or `:computer`) representing the winner.
- Override `to_s` to return a string that shows both scores.
- Do not expose accesors for the scores; keep them in `private`.

Modifications to the `RPSGame` class
- Update the welcome message with the number of points needed to win.
- Add a method `display_score` to print the current score.
- Add a method `update_score` to increment the score if it is not a tie.
- Add a method `display_game_winner` to `RPSGame` to congratulate the player that wins all the rounds.
- Add `system "clear"` in several places to improve the user experience.
- Move the game round logic into its own method. Nest the round loop inside a main game loop.

## Add Lizard and Spock

This is a variation on the normal Rock Paper Scissors game by adding two more options - Lizard and Spock.

Added more logic into the `Move` class.

## Add a class for each move

What would happen if we went even further and introduced 5 more classes, one for each move: `Rock`, `Paper`, `Scissors`, `Lizard`, and `Spock`. How would the code change? Can you make it work? After you're done, can you talk about whether this was a good design decision? What are the pros/cons?

- Reduced the amount of logic in the `Move` class.
- No longer using a nested collection to keep track of which move defeats which other moves.
- Added 5 more classes, increasing the length and complexity of the programs.
- Required a `case` expression to translate the human's string input into an object instantiation.

## Keep track of a history of moves

As long as the user doesn't quit, keep track of a history of moves by both the human and computer. What data structure will you reach for? Will you use a new class, or an existing class? What will the display output look like?

Noun: History
- Data structure is an Array
Verbs:
- Add Move to History
- Display History

Noun: MoveRecord
- Data structure: Hash containing Moves, Score, Game Number, Round Number, Player Data

When to display history? After the end of the game.

## Computer personalities

We have a list of robot names for our `Computer` class, but other than the name, there's really nothing different about each of them. It'd be interesting to explore how to build different personalities for each robot. For example, R2D2 can always choose "rock". Or, "Hal" can have a very high tendency to choose "scissors", and rarely "rock", but never "paper". You can come up with the rules or personalities for each robot. How would you approach a feature like this?

New class for each `Robot`, inheriting from `Computer`. Move the `choose` method into the subclass. Store the probabilities of choosing each of the 5 moves.

To choose a move, instead of generating random numbers and using a `case` statement, create an array `choices` which has numerous instances of the moves that are more likely to be selected.