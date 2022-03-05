=begin
What could you add to this class to simplify it and remove two methods from the 
class definition while still maintaining the same functionality?

Replace instance methods type and type=(t) with attr_accessor :type.
In describe_type, replace @type with type.
=end

class BeesWax
  attr_accessor :type

  def initialize(type)
    @type = type
  end

  # def type
  #   @type
  # end

  # def type=(t)
  #   @type = t
  # end

  def describe_type
    # puts "I am a #{@type} of Bees Wax"
    puts "I am a #{type} of Bees Wax"
  end
end