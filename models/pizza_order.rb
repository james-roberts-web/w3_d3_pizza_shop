require_relative ('../db/sql_runner')

class PizzaOrder

  attr_accessor :quantity, :topping, :customer_id
  attr_reader :id

  def initialize(options)

    @id = options['id'].to_i if options['id']
    @quantity = options['quantity'].to_i
    @topping = options['topping']
    @customer_id = options['customer_id'].to_i

  end

  def save

  sql = "INSERT INTO pizza_orders
  (quantity, topping, customer_id)
  VALUES ($1, $2, $3) RETURNING id"

  values = [@quantity, @topping, @customer_id ]
  new_order = SqlRunner.run(sql, values)
  @id = new_order[0]['id'].to_i

  end

  def PizzaOrder.all

    sql = "SELECT * FROM pizza_orders"
    orders = SqlRunner.run(sql)
    return orders.map { |order| PizzaOrder.new(order) }

  end

  def update

    sql = "UPDATE pizza_orders
        SET quantity = $1,
        topping = $2 WHERE id = $3"
    values = [@quantity, @topping, @id]
    SqlRunner.run(sql, values)

  end

  def delete

    sql = "DELETE FROM pizza_orders
    WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)

  end

  def find_all_orders_by_customer(customer_id)
    sql = "SELECT * FROM pizza_orders
    WHERE customer_id = $1"
    values = [customer_id]
    customer = SqlRunner.run(sql, values)
    return PizzaOrder.new(customer[0])
  end
  
  # def save
  #   # save the order to the database
  #   # connect to the database
  #   #
  #   db = PG.connect({ dbname: 'pizza_shop', host: 'localhost'})
  #
  #   sql = "INSERT INTO pizza_orders
  #   (first_name, last_name, quantity, topping)
  #
  #   VALUES ($1, $2, $3, $4) RETURNING id"
  #
  #
  #   values = [@first_name, @last_name, @quantity, @topping]
  #
  #   db.prepare("save", sql)
  #   # execute the SQL query
  #
  #   new_order = db.exec_prepared("save", values)
  #   @id = new_order[0]['id'].to_i
  #   # close the connection to the database
  #
  #   db.close
  #
  # end

end
