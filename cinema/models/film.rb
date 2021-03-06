
  require_relative('../db/sql_runner')

  class Film

  attr_reader :id
  attr_accessor :title, :price



  def initialize(options)
    @id = options['id']
    @title = options['title']
    @price = options['price'].to_i
  end

  def save
    sql = "INSERT INTO films(title, price)
    VALUES ($1, $2) RETURNING id"
    values = [@title, @price]
    @id = SqlRunner.run(sql, values)[0]['id']
  end


  def update()
      sql = "UPDATE films SET (title, price)
      = ($1, $2) WHERE id = $3"
      values = [@title, @price, @id]
      SqlRunner.run(sql, values)
  end

  # def delete()
  #   sql = "DELETE * FROM films where id = $1"
  #   values = [@id]
  #   SqlRunner.run(sql, values)
  # end

  def customer_film
  sql = "SELECT customers.name, films.title
  FROM customers INNER JOIN tickets
  ON customers.id = customer_id INNER JOIN films
  ON films.id = $1"

  end
  def self.delete_all()
    sql = "DELETE FROM films"
    SqlRunner.run(sql)
  end
  end
