=begin
Create a sub-class from Dog called Bulldog overriding the swim method to return 
"can't swim!"
=end

class Dog
  def speak
    'bark!'
  end

  def swim
    'swimming!'
  end
end

class Bulldog < Dog
  def swim
    "can't swim!"
  end
end

teddy = Dog.new
puts teddy.speak           # => "bark!"
puts teddy.swim           # => "swimming!"

rufus = Bulldog.new
puts rufus.speak
puts rufus.swim