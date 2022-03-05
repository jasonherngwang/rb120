# What could we add to the class below to access the instance variable @volume?
# A getter

class Cube
  def initialize(volume)
    @volume = volume
  end

  def get_volume
    volume
  end

  private

  attr_reader :volume
end

cube = Cube.new(125)
p cube.get_volume
p cube.instance_variable_get('@volume')