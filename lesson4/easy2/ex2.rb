class Oracle
  def predict_the_future
    "You will " + choices.sample
  end

  def choices
    ["eat a nice lunch", "take a nap soon", "stay at work late"]
  end
end

class RoadTrip < Oracle
  def choices
    ["visit Vegas", "fly to Fiji", "romp in Rome"]
  end
end

trip = RoadTrip.new
p trip.predict_the_future

=begin
The choices instance method in RoadTrip overrides that in Oracle. The instance 
methods in RoadTrip are searched earlier in the Method Lookup Path.
The 3 possible outputs are now:
You will visit Vegas
You will fly to Fiji
You will romp in Rome
=end