# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
10.times do
  Category.create(title: Faker::Commerce.brand)
end
p '10 Categories was created'

User.create(
  email: 'test@gmail.com',
  password: 'password',
  password_confirmation: 'password',
  name: 'Boris Johnson'
)
p 'User was created'

20.times do
  Product.create(user: User.first, title: Faker::Commerce.product_name, categories: [Category.first])
end
'20 Products was created'

