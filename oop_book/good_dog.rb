class GoodDog
  # Constant
  DOG_YEARS = 7

  # Creating getter and setter methods.
  attr_accessor :name, :age, :height, :weight

  # Class variable
  @@number_of_dogs = 0

  # Constructor instance method
  def initialize(n, a, h, w)
    @@number_of_dogs += 1
    self.name = n
    self.age = a * DOG_YEARS
    self.height = h
    self.weight = w
  end

  # Setter instance method
  def change_info(n, a, h, w)
    self.name = n
    self.age = a * DOG_YEARS
    self.height = h
    self.weight = w
  end

  # Override to_s instance method
  def to_s
    "#{self.name} is #{self.age} years old, weighs #{self.weight} lbs, and is #{height} inches tall."
  end

  # Usage of class variable
  def self.total_number_of_dogs   # Equivalent to: def GoodDog.total_number_of_dogs
    @@number_of_dogs
  end

  # Class self
  def self.what_am_i
    "I'm a GoodDog class!"
    self
  end

  # Instance self
  def what_is_self
    self
  end

  # Private instance methods are accessible from the non-private section of the class.
  def public_disclosure
    "#{self.name} is #{human_years} in human years."
  end

  # Private access modifier (applies to anything below this line)
  private

  # Private instance method
  def human_years
    age * DOG_YEARS
  end

end

# puts invokes to_s
puts GoodDog
# What is self, for a class?
puts GoodDog.what_am_i

# Instantiate an object using a class.
sparky = GoodDog.new("Sparky", 5, 16, 80)
# Use a getter instance method.
puts sparky.age
# Use the overriden to_s instance method.
puts sparky
# What is self, for an instance?
puts sparky.what_is_self

# fido = GoodDog.new("Fido", 3, 20, 100)
# puts fido

# Use a getter class method.
puts GoodDog.total_number_of_dogs

# Use a private instance method.
# sparky.human_years          # => private method exception
puts sparky.public_disclosure