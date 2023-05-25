# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# cleaning the DB
List.destroy_all
Movie.destroy_all

puts "#{Movie.all.count} film in the db"
puts "#{List.all.count} list in the db"

puts "creating the DB"

15.times do
  movie = Movie.new(
    title: Faker::Movie.title,
    overview: Faker::Movie.quote,
    poster_url: Faker::LoremFlickr.image,
    rating: (rand()*10).round(1)
  )
  movie.save
end

puts "#{Movie.all.count} films in the db"

4.times do
  List.create!(
    name: Faker::Name.middle_name
  )
end

puts "#{List.all.count} lists in the db"

5.times do
  Bookmark.create!(
    comment: Faker::Quotes::Shakespeare.as_you_like_it_quote,
    movie: Movie.all.sample,
    list: List.all.sample
  )
end

puts "#{Bookmark.all.count} bookmarks in the db"
