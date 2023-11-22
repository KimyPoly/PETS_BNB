# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

require "faker"
Review.delete_all
Booking.delete_all
Pet.delete_all
User.delete_all

User.create!(
  first_name: "Larry",
  last_name: "Louiso",
  email: "louiso@lewagon.fr",
  password: "123456"
 )

 User.create!(
  first_name: "Leveque",
  last_name: "Louis",
  email: "louis@lewagon.fr",
  password: "123456"
  )

 User.create!(
  first_name: "Lice",
  last_name: "Louisu",
  email: "louisu@lewagon.fr",
  password: "123456"
  )

 User.create!(
  first_name: "Lac",
  last_name: "Louisa",
  email: "louisa@lewagon.fr",
  password: "123456"
  )

 User.create!(
  first_name: "Luc",
  last_name: "Louise",
  email: "luc@lewagon.fr",
  password: "123456"
  )

  puts 'Creating 10 fake profil...'

  existing_user_ids = User.pluck(:id)

  locations = [
    'Eiffel Tower, Paris, France',
    'Statue of Liberty, New York, USA',
    'Taj Mahal, Agra, India',
    'Great Wall of China, Beijing, China',
    'Sydney Opera House, Sydney, Australia',
    'Machu Picchu, Cusco, Peru',
    'Colosseum, Rome, Italy',
    'Christ the Redeemer, Rio de Janeiro, Brazil',
    'Pyramids of Giza, Cairo, Egypt',
    'Tokyo Tower, Tokyo, Japan',
    'Acropolis of Athens, Athens, Greece',
    'Burj Khalifa, Dubai, UAE',
    'CN Tower, Toronto, Canada',
    'Sagrada Familia, Barcelona, Spain',
    'Golden Gate Bridge, San Francisco, USA',
    'Grand Canyon, Arizona, USA'
  ]

20.times do
  pets = Pet.new(
    user_id: existing_user_ids.sample,
    name: Faker::Creature::Dog.name,
    species: Faker::Creature::Animal.name,
    age: rand(1..12),
    habitat: ['Forêt', 'Desert', 'Jungle', 'Savane', 'Ocean'].sample,
    address: locations.sample,
    description: Faker::Movie.quote,
    photo_url: 'https://picsum.photos/id/237/200/200'
  )
  pets.save!
end
puts 'Finished!'
