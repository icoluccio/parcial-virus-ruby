# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Computadora.create!(memoria: 100, disco: 200)
Computadora.create!(memoria: 500, disco: 600)
Computadora.create!(memoria: 800, disco: 700)
Programa.create!(nombre: "Programa 1", memoria: 10, disco: 20)
Programa.create!(nombre: "Programa 2", memoria: 20, disco: 30)
Programa.create!(nombre: "Programa 3", memoria: 0, disco: 50)
Programa.create!(nombre: "Programa 4", memoria: 60, disco: 60)