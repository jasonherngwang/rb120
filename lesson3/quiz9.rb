module Speedy
  def run_fast
    @speed = 70
  end
end

class Animal
  def initialize(name, age)
    @name = name
    @age = age
  end
end

class Dog < Animal
  DOG_YEARS = 7

  def initialize(name, age)
    @dog_age = age * DOG_YEARS
  end
end

class Greyhound < Dog
  include Speedy
end

grey = Greyhound.new('Grey', 3)
p grey

=begin
@dog_age is initialized.
@name and @age are not initialized because the constructor is overriden in 
class Dog, and super is not invoked.
@speed is not initialized because the method run_fast is never invoked.
=end