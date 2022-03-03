class Person
  attr_accessor :first_name, :last_name

  def initialize(full_name)
    parse_full_name(full_name)
  end

  def name
    if self.last_name.empty?
      self.first_name
    else
      [self.first_name, self.last_name].join(' ')
    end
    # "#{first_name} #{last_name}".strip
  end

  def name=(full_name)
    parse_full_name(full_name)
  end

  def ==(other_person)
    self.name = other_person.name
  end

  private

  def parse_full_name(full_name)
    names = full_name.split
    self.first_name = names.first
    self.last_name = names.size > 1 ? names.last : ''
  end
end

bob = Person.new('Robert Smith')
rob = Person.new('Robert Smith')
p bob
p rob
p bob == rob

