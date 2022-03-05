class Student
  attr_accessor :name, :grade

  def initialize(name, age)
    @name = name
    @age = age
  end
end

jon = Student.new('John', 22)
p jon.name # => 'John'
jon.name = 'Jon'
jon.grade = 'B'
p jon.grade # => 'B'