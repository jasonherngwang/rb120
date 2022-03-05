=begin
If we call Hello.hi we get an error message. How would you fix this?

Create a class method Hello::hi which invokes greet.
Create a class method Greeting::greet which prints the passed message.
=end

class Greeting
  def greet(message)
    puts message
  end

  def self.greet(message)
    puts message
  end
end

class Hello < Greeting
  def hi
    greet("Hello")
  end

  def self.hi
    greet("Hello")                  # Invoke Greeting.greet class method.
    Greeting.new.greet("hello")     # Create new instance and invoke greet instance method.
  end
end

class Goodbye < Greeting
  def bye
    greet("Goodbye")
  end
end

Hello.hi