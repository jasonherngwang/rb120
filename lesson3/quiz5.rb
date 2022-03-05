class Thing
  attr_accessor :size

  def initialize(s)
    @size = s
  end

  def ==(other_thing)
    size == other_thing.size
  end
end

thing1 = Thing.new(5)
thing2 = Thing.new(5)
thing3 = thing1
thing1.size = 4

p thing1 == thing2        # => false. thing1 and thing3 have size 4. thing3 has size 5.
p thing2 == thing3        # => false. thing1 and thing3 have size 4. thing3 has size 5.
p thing3.equal? thing2    # => false. Reference different Thing objects.
p thing3.equal? thing1    # => true. Reference same Thing object.