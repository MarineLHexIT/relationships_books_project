# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
require 'faker'

50.times do

  author = Author.find_or_create_by(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name)
  edition = Edition.create(
    publisher: Publisher.find_or_create_by(name: Faker::Book.publisher),
    published_date: Faker::Date.between(from: '1950-01-01', to: Time.zone.today.to_date),
    published_type: %w[paperbook ebook audiobook].sample,
    published_language: %w[EN FR].sample
  )
  Book.create(
    title: Faker::Book.title,
    isbn: Faker::Code.isbn(base: 13),
    author: author,
    editions: [edition]
  )



end