
## Class `Scores`

Store score for each player in a hash.
Key: Player marker
  - Chose to use marker String instead of `Player` object as collaborator objects. Do not want increase complexity of the dependency graph.
Value: Integer initialized to `0`


## Classes `Human` and `Computer`

Both inherit from `Player`.
- `Human` has instance methods to choose name and marker.
- `Computer` has default name and marker set.

# Dependency Graph

- `TTTGame` collaborates with `Player`
- `TTTGame` collaborates with `Board`
- `TTTGame` collaborates with `Scores`
  - `TTTGame` retrieves winning marker from `Board` and passes it to `Scores`. No direct collaboration between `Scores` and `Board`.
- `Board` collaborates with `Square`