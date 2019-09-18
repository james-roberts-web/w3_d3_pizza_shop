require_relative ('../db/sql_runner')

class Customer

  attr_accessor :first_name, :last_name
  attr_reader :id

  def initialize(options)

    @id = options['id'].to_i if options['id']
    @first_name = options['first_name']
    @last_name = options['last_name']

  end

  def save_customers

  sql = "INSERT INTO customers
  (first_name, last_name)
  VALUES ($1, $2) RETURNING id"
  values = [@first_name, @last_name]
  new_customer = SqlRunner.run(sql, values)
  @id = new_customer[0]['id'].to_i

  end

  def Customer.all

    sql = "SELECT * FROM customers"
    customers = SqlRunner.run(sql)
    return customers.map { |customer_name| Customer.new(customer_name) }

  end

  def update_customers

    sql = "UPDATE customers
        SET first_name = $1,
        last_name = $2 WHERE id = $3"
    values = [@first_name, @last_name, @id]
    SqlRunner.run(sql, values)

  end

  def delete_customers

    sql = "DELETE FROM customers
    WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)

  end

  def delete_all_customers

    sql = "DELETE * FROM customers"
    SqlRunner.run(sql)

  end

  def find_customer_by_id(customer_id)
    sql = "SELECT * FROM customers
    WHERE id = $1"
    values = [customer_id]
    customer =  SqlRunner.run(sql)[0]
    return Customer.new(customer)
  end

end
