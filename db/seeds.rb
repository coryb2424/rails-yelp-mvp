# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

CATEGORY = %w[chinese italian japanese french belgian].freeze

5.times do
  rest = Restaurant.create!(
    name: Faker::Restaurant.name,
    category: CATEGORY.sample,
    phone_number: Faker::PhoneNumber.phone_number,
    address: Faker::Address.full_address
  )

  rand(3..10).times do
    rev = Review.new(
      content: Faker::Restaurant.review,
      rating: rand(0..5)
    )

    rev.restaurant = rest
    rev.save
  end
end
