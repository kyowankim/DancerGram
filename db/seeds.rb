# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Account.create ([
    {username: "johndoe", first_name: "John", last_name: "Doe", email: "johndoe@gmail.com", password: "password"},
    {username: "alicekim", first_name: "Alice", last_name: "Kim", email: "alicekim@gmail.com", password: "password"},
    {username: "susanbaker", first_name: "Susan", last_name: "Baker", email: "susanbaker@gmail.com", password: "password"},
])