# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

u1 = User.create(username:Faker::Name.name, password:"password")
s1 = Sub.create(title:"first_sub", moderator_id: u1.id)
s2 = Sub.create(title:"second_sub", moderator_id: u1.id)