require_relative('models/film')
require_relative('models/ticket')
require_relative('models/customer')

Ticket.delete_all
Film.delete_all
Customer.delete_all

film1 = Film.new('title' => 'Film1', 'price' => 5)
film1.save

film1.title = 'Film'
film1.update


film2 = Film.new('title' => 'Film2', 'price' => 6)
film2.save
film2.price = 5
film2.update

customer1 = Customer.new( 'name' => 'Raul','funds' => 50)
customer1.save
customer1.name = 'Florin'
customer1.update

customer2 = Customer.new( 'name' => 'Matei','funds' => 30)
customer2.save
customer2.funds = 40
customer2.update

customer3 = Customer.new( 'name' => 'Sho','funds' => 20)
customer3.save


ticket1 = Ticket.new('customer_id' => customer1.id, 'film_id' => film2.id)
ticket1.save

ticket2 = Ticket.new('customer_id' => customer2.id, 'film_id' => film2.id)
ticket2.save

ticket3 = Ticket.new('customer_id' => customer3.id, 'film_id' => film1.id)
ticket3.save
