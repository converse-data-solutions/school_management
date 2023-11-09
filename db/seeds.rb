# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
admin = User.create(email: 'admin@gmail.com', name: 'admin', username: 'admin', mobile_number: '1234567890',
                    address: 'address', password: 'admin@123', role: 'admin', active: true)
