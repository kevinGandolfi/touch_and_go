# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
Airplane.destroy_all
User.destroy_all
kevin = User.create({ first_name: "Kevin", last_name: "Gandolfi", email: "blalbla@french.com", password: "Olga_is_the_best" })
plane = Airplane.new({ brand_and_model: "GULFSTREAM G700", weight: 48_806, registration: "N700GS", range: 7_500, speed: "MACH 0.90", max_altitude: 51_000, number_of_engines: 2, pax_capacity: 10 })
plane.user = kevin
plane.save
