class Parent
  def say_hi
    p "Hi from Parent."
  end
end

class Child < Parent
  # Overriding method say_hi from superclass Parent.
  def say_hi
    p "Hi from Child."
  end

  # Overriding method send from superclass Object.
  def send
    p "send from Child"
  end

  # Overriding method instance_of? from superclass Object.
  def instance_of?
    p "I am a fake instance"
  end
end

child = Child.new
child.say_hi

son = Child.new
# son.send :say_hi               # => Exception: wrong number of arguments.
puts son.instance_of? Child      # => Exception: wrong number of arguments.
puts son.instance_of? Parent     # => Exception: wrong number of arguments.