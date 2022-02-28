class Animal
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def speak
    "Hello!"
  end
end

class GoodDog < Animal
  attr_accessor :name, :color

  # Allow superclass to assign name. Assign color here in subclass.
  def initialize(name, color)
    super(name)
    @color = color
  end

  # Override speak method inherited from Animal.
  # Use super to invoke speak from Animal. Use super() since we don't want to forward message.
  def speak(message)
    "#{self.name} says #{message} and #{super()}"
  end
end

class Cat < Animal
end

sparky = GoodDog.new("Sparky", "brown")
p sparky

# paws = Cat.new("Paws", "calico")
# p paws

puts sparky.speak('WOOOOOF!')
# puts paws.speak