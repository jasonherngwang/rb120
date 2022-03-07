# OOP Twenty-One Game

## Questions

**What object should deal the cards? The deck or the game?**

The game should deal the cards. Although in the real world, a human dealer deals the cards, in this program the dealer is treated as just another player. It is a "dealer" in name only, not function. The game is treated as a 3rd party game orchestrator, as if there were a 3rd person standing next to the game table, whose only function is to move cards around. 

The game has as collaborator objects the deck and the players. It removes cards from the deck and passes them to the players. The deck should not interact directly with the players because in the real world the player does not physically interact with the deck.

**Aces can be 1 or 11. Where should this logic be stored and executed?**

Each player has as collaborator objects the cards in their hand. The calculation of the total hand value involves the logic of determining the value of Aces in the hand. This logic should not be stored in an instance of the Ace `Card` object because a card should have no knowlege of the context is which it is being scored. The proper context is in the `Hand` class/module.

**Player and Dealer have different logic for deciding whether to *hit* or *stay*. Where should this logic go?**

Modeling the real-world, the `Participant` uses his/her brain to decide whether to hit or stay. Therefore, this logic should be located in the `Participant` class. However, the `Player` and `Dealer` have different logic. The `Player`'s choices are determined by the user, while the `Dealer` will always follow the same logic. Therefore, a predicate instance method `should_hit?` can be implemented in the subclasses `Player` and `Dealer` instead of in the superclass `Participant`. This is an example of polymorphism, where the `Game` orchestrator can invoke `should_hit?` on the player or dealer, and each will respond to it in a different way. The subsequent act of hitting or staying is common to both the player and dealer and can therefore be implemented in the `Participant` superclass.

## Class Responsibility Collaborator (CRC) Cards

Only list *public* methods callable from outside the class. Do not list implementation details, e.g. private instance methods.


### **Class: `Template`**

Superclass: None

Responsibilities
- Has attribute XYZ.
- Can perform action XYZ.

Collaborators
- Contains instances of `OtherClass` as part of its state.


### **Class: `Deck`**

Superclass: None

Responsibilities
- Has attribute `cards` which is an Array to store `Card`s.
- Starts with 52 `Card`s.
- Should the instance method `deal_card` be in `Deck` or in the main `Game` class? Who is dealing the cards?

Collaborators
- `Card`


### **Class: `Card`**

Superclass: None

Responsibilities
- Has attribute `suit`: Spade, Heart, Club, Diamond
- Has attribute `rank`: 2-10, Jack, Queen, King, Ace

Collaborators
- None


### **Module: `Hand`**

Superclass: None

Responsibilities
- Has 0 or more `Cards`
- Has behavior `hand_value` which returns the numerical value of its constituent `Card`s.
  - Cards can be worth `1`-`11`.
  - Handles the logic of determining whether Aces are valued as `1` or `11`.

Collaborators
- `Card`


### **Class: `Participant`**

Superclass: None

Responsibilities
- Has attribute `hand`: An Array of `Card`s
- Has attribute `name` which is an instance of `Hand`.
- Has behavior `busted?` which returns a boolean indicating whether the current `hand_value` exceeds `21`.
- Has behavior `hit` which pops a `Card` from an instance of `Deck` and appends it to `hand`.
- Has behavior `stay` which ends the participant's turn.

Collaborators
- `Hand`


### **Class: `Player`**

Superclass: `Participant`

Responsibilities
- Has behavior `set_name` which allows the player to input their own name.

Collaborators
- None


### **Class: `Computer`**

Superclass: `Participant`

Responsibilities
- Initializes its own name as `'Computer'`.

Collaborators
- None


### **Class: `Game`**

The orchestrator of the game flow.

Superclass: None

Responsibilities
- Has human player, instance of `Player`
- Has computer player, instance of `Computer`
- Has behavior `play` to start a new game.

Collaborators
- `Player`
- `Computer`