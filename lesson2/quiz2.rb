class Student
  # class body
  def initialize(name)
    @name = name
    @grade = nil
  end
end

ade = Student.new('Adewale')
p ade # => #<Student:0x00000002a88ef8 @grade=nil, @name="Adewale">