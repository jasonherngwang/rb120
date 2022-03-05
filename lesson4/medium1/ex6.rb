=begin
What is the difference in the way the code works?

They work the same. For the second method, can remove the unnecessary self 
from show_template because a getter method is available.
=end

class Computer
  attr_accessor :template

  def create_template
    @template = "template 14231"
  end

  def show_template
    template
  end
end

class Computer
  attr_accessor :template

  def create_template
    self.template = "template 14231"
  end

  def show_template
    self.template
  end
end