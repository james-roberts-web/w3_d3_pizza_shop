require_relative('./pizza_order')
require_relative('./customer')
require('pry')

new_customer_details_1 = {
  'first_name' => 'Jim',
  'last_name' => 'Skywalker'
}
new_customer_1 = Customer.new(new_customer_details_1)
new_customer_1.save_customers

new_pizza_order_1 = {
  'quantity' => 2,
  'topping' => 'Pepperoni',
  'customer_id' => new_customer_1.id
}
new_order_1 = PizzaOrder.new(new_pizza_order_1)
new_order_1.save

new_customer_details_2 = {
  'first_name' => 'Garth',
  'last_name' => 'Vader'
}
new_customer_2 = Customer.new(new_customer_details_2)
new_customer_2.save_customers

new_pizza_order_2 = {
  'quantity' => 3,
  'topping' => 'Dark Side Chillies',
  'customer_id' => new_customer_2.id
}
new_order_2 = PizzaOrder.new(new_pizza_order_2)
new_order_2.save

new_pizza_order_3 = {
  # to order into customer 1
  'quantity' => 3,
  'topping' => 'Ham and Pineapple',
  'customer_id' => new_customer_1.id
}
new_order_3 = PizzaOrder.new(new_pizza_order_3)
new_order_3.save

p new_customer_2.id
binding.pry
new_customer_2.find_all_orders_by_customer(2)



# order1.save
# order2.save
#
# order1.quantity = 9
# order1.update

# all_orders = PizzaOrder.all
#
# order1.delete

binding.pry
nil
