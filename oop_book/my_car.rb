module PaintUpgradable
  def two_tone_paint(color1, color2)
    self.color = "#{color1}-#{color2}"
    puts "Special paint job: #{self.color}."
  end
end

class Vehicle
  # Getter and setter methods
  attr_accessor :color
  attr_reader :year, :model
  
  # Class variable
  @@number_of_vehicles = 0

  # Constructor instance method
  def initialize(year, color, model)
    @@number_of_vehicles += 1
    @year = year
    @color = color
    @model = model
    @current_speed = 0
  end
  
  # Instance methods
  def speed_up(number)
    @current_speed += number
    puts "Speed up by #{number} mph."
  end
  
  def brake(number)
    @current_speed = [0, @current_speed - number].max
    puts "Slowed by #{number} mph."
  end
  
  def current_speed
    puts "Traveling at #{@current_speed} mph."
  end
  
  def shut_down
    @current_speed = 0
    puts "Parked vehicle."
  end
  
  def spray_paint(color)
    old_color = self.color
    self.color = color
    puts "Changed color from #{old_color} to #{color}."
  end

  # Class methods
  def self.total_number_of_vehicles
    @@number_of_vehicles
  end

  def self.gas_mileage(distance, gas_usage)
    mpg = distance.to_f / gas_usage
    puts "#{mpg} mpg"
  end
end

class MyCar < Vehicle
  include PaintUpgradable

  NUM_OF_DOORS = 4

  def to_s
    "You have a nice car: #{color} #{year} #{model}."
  end
end

class MyTruck < Vehicle
  NUM_OF_DOORS = 2
  
  def to_s
    "You have a nice truck: #{color} #{year} #{model}."
  end
end


# Instantiate object from class.
beetle = MyCar.new("2016", "Blue", "Beetle")
# Use overridden to_s instance method.
puts beetle
# Use getter methods.
puts "I have a nice #{beetle.color} #{beetle.year} #{beetle.model}."

puts "Traveling...................."
beetle.speed_up(50)
beetle.current_speed
beetle.speed_up(30)
beetle.current_speed
beetle.brake(40)
beetle.current_speed
beetle.brake(40)
beetle.current_speed
beetle.shut_down
beetle.current_speed
puts

beetle.spray_paint("Orange")
beetle.two_tone_paint("Red", "Green")
puts beetle.color

# Use class methods.
MyCar.gas_mileage(300, 10)

# Truck
tacoma = MyTruck.new("1990", "White", "Tacoma")
puts tacoma
tacoma.spray_paint("Silver")

# Vehicle class variable
puts Vehicle.total_number_of_vehicles

# Method lookup path
puts MyCar.ancestors
puts MyTruck.ancestors
puts Vehicle.ancestors