=begin
Setter methods always return the passed argument, not the last evaluated 
expression of the setter method, even if using the return keyword.
- Setter methods return the last state of the passed argument, so it 
  can be mutated within the method. Reassignment does not affect it.
=end

class Lunch
  attr_reader :main_course
  
  def initialize(main_course, dessert)
    @main_course = main_course
    @dessert = dessert
  end
  
  def main_course=(new_course)
    @main_course = new_course         # Instance variable references the object and will reflect any mutations.
    new_course << " with Fries"       # Mutation of the argument affects the return value. This is the "final state" of the object.
    new_course = "Beef Stew"          # Reassignment does not affect the return value.
    new_course << " and Vegetables"
    return "Mussels"
  end
end

my_lunch = Lunch.new("Burger", "Pie")
p my_lunch.main_course = "Steak"
p my_lunch.main_course