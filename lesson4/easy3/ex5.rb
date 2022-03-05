class Television
  def self.manufacturer
    # method logic
  end

  def model
    # method logic
  end
end

tv = Television.new
tv.manufacturer          # => NoMethodError
tv.model                 # Executes logic in model

Television.manufacturer  # Executes logic in self.manufacturer
Television.model         # => NoMethodError