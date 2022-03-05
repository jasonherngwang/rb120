class Shape
  @@sides = nil

  def self.sides
    @@sides
  end

  def sides
    @@sides
  end
end

class Triangle < Shape
  def initialize
    @@sides = 3
  end
end

class Quadrilateral < Shape
  def initialize
    @@sides = 4
  end
end

t = Triangle.new         # Reassigns Shape::size to 3
p Triangle.sides         # => 3
q = Quadrilateral.new    # Reassigns Shape::size to 4
p Triangle.sides         # => 4

p Triangle.new.sides     # => 3. Immediately after instantiating an object, Shape::size will be reassigned to 3. Never 4.

