=begin
Which of these two classes has an instance variable and how do you know?

Fruit reassigns its parameter name to itself.
Pizza initializes an instance variable @name to the passed object.
=end

class Fruit
  def initialize(name)
    name = name
  end
end

class Pizza
  def initialize(name)
    @name = name
  end
end

apple = Fruit.new("apple")
p apple
p apple.instance_variables

pizza = Pizza.new("cheese")
p pizza
p pizza.instance_variables