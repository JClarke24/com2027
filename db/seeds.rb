# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

tutor1 = Tutor.new
tutor1.email = 'john@hotmail.com'
tutor1.password = '123456'
tutor1.password_confirmation = '123456'
tutor1.forename = 'john'
tutor1.surname = 'smith'
tutor1.location = '(51.23621999999999, -0.570409000000005)'
tutor1.save!
