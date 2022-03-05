=begin
Which one of these is a class method (if any) and how do you know? 
How would you call a class method?

self.manufacturer is a class method, prefixed by `self.`.
=end

class Television
  def self.manufacturer
    # method logic
  end

  def model
    # method logic
  end
end

Television.manufacturer