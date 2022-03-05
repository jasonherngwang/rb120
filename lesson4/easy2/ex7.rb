=begin
Explain what the @@cats_count variable does and how it works. 
What code would you need to write to test your theory?

It is a class variable keeping track of the total number of Cat objects 
instantiated (cats born, since they are age 0).

=end

class Cat
  @@cats_count = 0

  def initialize(type)
    @type = type
    @age  = 0
    @@cats_count += 1
  end

  def self.cats_count
    @@cats_count
  end
end

puts Cat.cats_count
socks = Cat.new('calico')
puts Cat.cats_count
paws = Cat.new('tabby')
puts Cat.cats_count
cuddles = Cat.new('shorthair')
puts Cat.cats_count