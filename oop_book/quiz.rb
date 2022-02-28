# Question 14

# class Person
#   attr_accessor :name
# end

# class Person
#   attr_writer :name

#   def name
#     @name
#   end
# end

# class Person
#   attr_reader :name

#   def name=(name)
#     @name = name
#   end
# end

class Person
  def name
    @name
  end

  def name=(name)
    @name = name
  end
end

kate = Person.new
kate.name = 'Kate'
p kate.name # => 'Kate'


# Question 15

class Person
  attr_writer :first_name, :last_name

  def full_name
    @first_name + ' ' + @last_name
  end
end

mike = Person.new
mike.first_name = 'Michael'
mike.last_name = 'Garcia'
p mike.full_name # => 'Michael Garcia'


# Question 16

class Student
  attr_accessor :name, :grade

  def initialize(name)
    @name = name
    @grade = nil
  end

  def change_grade(new_grade)
    self.grade = new_grade
  end
end

priya = Student.new("Priya")
priya.change_grade('A')
p priya.grade # => "A"