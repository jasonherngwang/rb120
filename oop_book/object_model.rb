# Modules
module Speak
  def speak(sound)
    puts "#{sound}"
  end
end

module Eat
  def eat(food)
    puts "I am eating #{food}."
  end
end

# Namespacing
module Animals
  class GoodDog
    include Speak, Eat
  end

  class Cat
    include Speak, Eat
  end
end

class HumanBeing
  include Speak
end

# Object Instantiation
sparky = Animals::GoodDog.new
sparky.speak("Woof!")
sparky.eat("Kibble")

# Method Lookup Path
puts "GoodDog ancestors:"
puts Animals::GoodDog.ancestors
puts
puts "HumanBeing ancestors:"
puts HumanBeing.ancestors
puts