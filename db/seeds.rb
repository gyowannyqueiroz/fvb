# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Currency.create(name: 'Money - CAD')

Client.create(name: 'Gyowanny', parent: true)
parent = Client.last
Client.create(name: 'Gabriel', parent: false, parent_client_id: parent.id)
Client.create(name: 'Davi', parent: false, parent_client_id: parent.id)

currency = Currency.last
Account.create(initial_amount: 0.0, client_id: 2, currency_id: currency.id)
Account.create(initial_amount: 0.0, client_id: 3, currency_id: currency.id)

