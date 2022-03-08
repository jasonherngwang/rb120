class Customer
  def initialize(name)
    @name = name
  end

  def place_order
    @order = Order.new
  end

  def order_cost
    @order.total
  end
end

class Order
  def initialize
    @burger = Burger.new
    @side = Side.new
    @drink = Drink.new
  end
  
  def meal
    [@burger, @side, @drink]
  end

  def to_s
    meal.map(&:to_s).join(', ')
  end

  def total
    total_cost = @burger.cost + @side.cost + @drink.cost
    format("$%.2f", total_cost) # #format formats the cost to two decimal places
  end
end

class MealItem
  def initialize
    @option = choose_option
  end
  
  def choose_option
    puts "Please choose a #{self.class} option:"
    puts item_options # item_options returns a list of options and prices
                      # for a particular item type
    gets.chomp
  end

  def item_options
    self.class::OPTIONS.map do |num, details|
      "#{num}) #{details[:name]} #{format("$%.2f", details[:cost])}"
    end
  end

  def to_s
    self.class::OPTIONS[@option][:name]
  end

  def cost
    self.class::OPTIONS[@option][:cost]
  end
end

class Burger < MealItem
  OPTIONS = {
    '1' => { name: 'LS Burger', cost: 3.00 },
    '2' => { name: 'LS Cheeseburger', cost: 3.50 },
    '3' => { name: 'LS Chicken Burger', cost: 4.50 },
    '4' => { name: 'LS Double Deluxe Burger', cost: 6.00 }
  }
end

class Side < MealItem
  OPTIONS = {
    '1' => { name: 'Fries', cost: 0.99 },
    '2' => { name: 'Onion Rings', cost: 1.50 }
  }
end

class Drink < MealItem
  OPTIONS = {
    '1' => { name: 'Cola', cost: 1.50 },
    '2' => { name: 'Lemonade', cost: 1.50 },
    '3' => { name: 'Vanilla Shake', cost: 2.00 },
    '4' => { name: 'Chocolate Shake', cost: 2.00 },
    '5' => { name: 'Strawberry Shake', cost: 2.00 }
  }
end

jason = Customer.new('Jason')
jason.place_order
p jason.order_cost
p jason