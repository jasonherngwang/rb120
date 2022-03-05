class Circle
  attr_reader :radius

  def initialize(r)
    @radius = r
  end

  def >(other)
    radius > other.radius
  end

  def ==(other)
    radius == other.radius
  end
end

circle1 = Circle.new(5)
circle2 = Circle.new(3)
circle3 = Circle.new(5)

p circle1 > circle2   # => true. 5 > 3
p circle2 < circle3   # => NoMethodError. No < method defined.
p circle1 == circle3  # => true. Both 5.
p circle3 != circle2  # => true. 5 != 3. != method was given when == method was defined.