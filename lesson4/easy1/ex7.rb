=begin
What is the default return value of to_s when invoked on an object? 
Where could you go to find out if you want to be sure?

All objects inherit from the Object class, which has method Object#to_s.
#to_s prints the object's class and an encoding of the object's id.
=end