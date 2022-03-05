module Taste
  def flavor(flavor)
    puts "#{flavor}"
  end
end

class Orange
  include Taste
end

class HotSauce
  include Taste
end

puts Orange.ancestors
puts HotSauce.ancestors

=begin
What is the lookup chain for Orange and HotSauce?
Orange or HotSauce
Taste
Object
Kernel
BasicObject
=end