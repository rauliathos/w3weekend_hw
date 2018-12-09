require_relative('../db/sql_runner.rb')



class Customer

  attr_reader :id
  attr_accessor :name, :funds


  def initialize(options)
    @id = options['id'] if options['id']
    @name = options['name']
    @funds = options['funds'].to_i
  end

  def save()
    sql = "INSERT INTO customers(name, funds)
    VALUES ($1, $2) RETURNING id"
    values = [@name, @funds]
    @id = SqlRunner.run(sql, values)[0]['id']
  end

  def update()
      sql = "UPDATE customers SET (name, funds)
      = ($1, $2) WHERE id = $3"
      values = [@name, @funds, @id]
      SqlRunner.run(sql, values)
  end

  # def delete()
  #   sql = "DELETE * FROM customers where id = $1"
  #   values = [@id]
  #   SqlRunner.run(sql, values)
  #end


  def self.delete_all()
    sql = "DELETE FROM customers"
    SqlRunner.run(sql)
  end
end
