=begin
If we have a Car class and a Truck class and we want to be able to go_fast, how 
can we add the ability for them to go_fast using the module Speed? How can you 
check if your Car or Truck can now go fast?

Use include to mixin the module.

Question 3
The self keyword in Speed references the calling object. The #class method 
returns the object's class. The class name is interpolated into a string.
=end

module Speed
  def go_fast
    puts "I am a #{self.class} and going super fast!"
  end
end

class Car
  include Speed

  def go_slow
    puts "I am safe and driving slow."
  end
end

class Truck
  include Speed

  def go_very_slow
    puts "I am a heavy truck and like going very slow."
  end
end

p Car.method_defined? :go_fast
Car.new.go_fast

p Truck.method_defined? :go_fast
Truck.new.go_fast