# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

airport_codes = %w[NYC LAX ORD ATL DFW DEN SFO SEA MIA BOS LAS PHX IAH CLT EWR]

airport_codes.each do |code|
  Airport.create!(code: code)
end

puts "Seeded #{Airport.count} airports."


airport_ids = Airport.pluck(:id)

50.times do
  departure_airport_id, arrival_airport_id = airport_ids.sample(2)

  Flight.create!(
    departure_airport_id: departure_airport_id,
    arrival_airport_id: arrival_airport_id,
    flight_duration: rand(60..300),
    date_time: Faker::Time.between(from: DateTime.now, to: 1.month.from_now)
  )
end

puts "Seeded #{Flight.count} flights."
