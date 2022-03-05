module Describable
  def describe_shape
    "I am a #{self.class} and have #{self.class::SIDES} sides."  # Square::SIDES
  end
end

class Shape
  include Describable

  def self.sides
    self::SIDES       # Invoking class method Square.sides returns SIDES inherited from Quadrilateral.
  end
end

class Quadrilateral < Shape
  SIDES = 4                        # Inherited by Square

  def sides                        # Square inherits instance method sides.
    SIDES
  end
end

class Square < Quadrilateral; end

p Square.sides # => 4
p Square.new.sides # => 4
p Square.new.describe_shape # => "I am a Square and have 4 sides."