# Modules containing various behaviors
module Swimmable
  def swim
    "I'm swimming!"
  end
end

module Walkable
  def walk
    "I'm walking!"
  end
end

module Climbable
  def climb
    "I'm climbing"
  end
end

# Superclass Animal
class Animal
  include Walkable

  def speak
    "Hello good sir!"
  end
end

# Subclasses of Animal
class Fish < Animal
  include Swimmable           # Mix in Swimmable module
end

class Mammal < Animal
end

class Cat < Mammal
end

class Dog < Mammal
  include Swimmable           # Mix in Swimmable module
  include Climbable
end

# Instantiation of objects from classes
sparky = Dog.new
nemo   = Fish.new
paws   = Cat.new

# Method lookup
p sparky.swim
p sparky.climb
# p nemo.swim
# p paws.swim                   # => NoMethodError