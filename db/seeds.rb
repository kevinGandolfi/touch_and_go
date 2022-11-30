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

plane = Airplane.new({ brand_and_model: "DASSAULT FALCON 8X", weight: 33_112, registration: "CS-TCR", range: 6_450, speed: "MACH 0.90", max_altitude: 51_000, number_of_engines: 3, pax_capacity: 15 })
plane.user = kevin
plane.save
plane = Airplane.new({ brand_and_model: "CESSNA 152", weight: 750, registration: "CS-ASP", range: 768, speed: 107, max_altitude: 14_700, number_of_engines: 1, pax_capacity: 1 })
plane.user = kevin
plane.save
plane = Airplane.new({ brand_and_model: "BEECHCRAFT KING AIR 350I", weight: 6_804, registration: "F-KMJG", range: 1806, speed: 312, max_altitude: 35_000, number_of_engines: 2, pax_capacity: 11 })
plane.user = kevin
plane.save
plane = Airplane.new({ brand_and_model: "AIRBUS ACJ 319", weight: 78_200, registration: "G-JFOG", range: 6000, speed: 0.82, max_altitude: 41_000, number_of_engines: 2, pax_capacity: 50 })
plane.user = kevin
plane.save
plane = Airplane.new({ brand_and_model: "VELIS ELECTRO", weight: 600, registration: "CS-AEL", range: 75, speed: 90, max_altitude: 12_000, number_of_engines: 1, pax_capacity: 1 })
plane.user = kevin
plane.save
