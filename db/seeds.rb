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
Programa.create!(nombre: "Liviano", memoria: 1, disco: 2)
Programa.create!(nombre: "Medio", memoria: 20, disco: 30)
Programa.create!(nombre: "Pesado", memoria: 100, disco: 100)
virus = ProgramaVirus.create!(nombre: "Virus", memoria: 10, disco: 10, potencia: 1)
Programa.create!(nombre: "Hospedando virus", memoria: 1, disco: 1, programas: [virus])
