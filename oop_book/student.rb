class Student 
  def initialize(name, grade)
    @name = name
    @grade = grade
  end

  # Instance can invoke protected instance methods on another instance of the same class.
  def better_grade_than?(other_student)
    grade > other_student.grade
  end
  
  protected

  def grade
    @grade
  end

end

joe = Student.new("Joe", 95)
bob = Student.new("Bob", 92)

p "Well done!" if joe.better_grade_than?(bob)
p joe.grade          # => Error. Protected method.