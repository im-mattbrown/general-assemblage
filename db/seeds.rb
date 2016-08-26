# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all

p "deleting users..."

USERS = [
  {
    first_name: "Switt",
    last_name: "Switt",
    email: "switt@yahoo.com",
    user_name: "Switter",
    image_url: "https://cdn4.iconfinder.com/data/icons/small-n-flat/24/user-alt-128.png",
    course_taken: "Web Development Immersive",
    city: "Chicago",
    password_digest: "$2a$10$NgAP4WW978uoGdgmkZ9xqeS0bUAm9We9TfylhUNP016BAE276znA2"
  }
]

User.create(USERS)

p "#{User.count} users created!"
