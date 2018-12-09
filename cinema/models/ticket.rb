
require_relative('../db/sql_runner')


class Ticket

  attr_reader :id
  attr_accessor :customer_id, :ticket_id



  def initialize(options)
    @id = options['id'] if options["id"]
    @customer_id = options['customer_id']
    @film_id = options['film_id']
  end


  def save
    sql = "INSERT INTO tickets(customer_id, film_id)
    VALUES ($1, $2) RETURNING id"
    values = [@customer_id, @film_id]
    @id = SqlRunner.run(sql, values)[0]['id']
  end

  def update()
      sql = "UPDATE tickets SET (customer_id, film_id)
      = ($1, $2) WHERE id = $3"
      values = [@customer_id, @film_id, @id]
      SqlRunner.run(sql, values)
  end

  # def delete()
  #   sql = "DELETE * FROM tickets where id = $1"
  #   values = [@id]
  #   SqlRunner.run(sql, values)
  # end




  def self.delete_all()
      sql = "DELETE FROM tickets"
      SqlRunner.run(sql)
  end

end
