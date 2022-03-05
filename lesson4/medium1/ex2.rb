=begin
Alan created the following code to keep track of items for a shopping cart 
application he's writing:

Alyssa looked at the code and spotted a mistake. "This will fail when 
update_quantity is called", she says.

Can you spot the mistake and how to address it?

There's no setter method for @quantity. Add attr_accessor for @quantity.
Use self.quantity in update_quantity.
=end

class InvoiceEntry
  # attr_reader :quantity, :product_name
  attr_accessor :quantity
  attr_reader :product_name

  def initialize(product_name, number_purchased)
    @quantity = number_purchased
    @product_name = product_name
  end

  def update_quantity(updated_count)
    # prevent negative quantities from being set
    quantity = updated_count if updated_count >= 0
  end
end