=begin
Create a new class called Cat, which can do everything a dog can, except swim 
or fetch. Assume the methods do the exact same thing. Hint: don't just copy 
and paste all methods in Dog into Cat; try to come up with some class 
hierarchy.
=end

class Animal
  def run
    'running!'
  end

  def jump
    'jumping!'
  end
end

class Dog < Animal
  def speak
    'bark!'
  end

  def swim
    'swimming!'
  end

  def fetch
    'fetching!'
  end
end

class Bulldog < Dog
  def swim
    "can't swim!"
  end
end

class Cat < Animal
  def speak
    'meow!'
  end
end

fido = Dog.new
p fido.speak
p fido.run
p fido.jump
p fido.swim
p fido.fetch

grumpy = Bulldog.new
p grumpy.run
p grumpy.swim

clawz = Cat.new
p clawz.speak
p clawz.run
p clawz.jump
# p clawz.swim
# p clawz.fetch