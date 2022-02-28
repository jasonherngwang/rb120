# Initialize new object
class GoodDog
  attr_accessor :name, :height, :weight

  # Instance method, Constructor
  def initialize(n, h, w)
    # Instance variables
    @name = n
    @height = h
    @weight = w
  end

  # Getter method (replaced using attr_accessor)
  # def name
  #   @name
  # end

  # Setter method (replaced using attr_accessor)
  # def name=(n)
  #   @name = n
  # end

  def change_info(n, h, w)
    self.name = n
    self.height = h
    self.weight = w
  end

  def info(x)
    "#{name} weighs #{weight} and is #{height} tall."
  end

  # Instance method
  def speak
    # "#{@name} says woooof!!!"
    "#{name} says woooof!!!"       # Change @name to name, using getter
  end
end

sparky = GoodDog.new("Sparky", "12 inches", "10 lbs")
puts sparky.speak
puts sparky.info
sparky.change_info("Spartacus", "24 inches", "45 lbs")
puts sparky.info


# fido = GoodDog.new("Fido")
# puts fido.speak