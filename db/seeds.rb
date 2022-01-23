# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
(1..50).each do |i|
  count = Faker::Number.number(digits: 3)
  price = Faker::Number.within(range: 1..10000)
  Stock.create!(name: Faker::Company.name, selling_price: price, total_count: count, current_price: price, 
    available_count: count)
end
