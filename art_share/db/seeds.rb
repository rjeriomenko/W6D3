# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

ApplicationRecord.transaction do 

puts "Destroying tables!"

ArtworkShare.destroy_all
Artwork.destroy_all
User.destroy_all

puts "Resetting Primary Keys!"

%w(artwork_shares artworks users).each do |table_name|
    ApplicationRecord.connection.reset_pk_sequence!(table_name)
end 

puts "Creating Artists"
100.times do 
    User.create(username: Faker::Artist.name)
end

puts "Creating Artwork"
100.times do |artist_index|
    Artwork.create(title: Faker::Books::Lovecraft.deity, artist_id: artist_index, image_url: Faker::Avatar.image)
end

puts "Creating ArtworkShares"

100.times do |artwork_id| 
    ArtworkShare.create(artwork_id: artwork_id, viewer_id: rand(1..49))
end
100.times do |artwork_id| 
    ArtworkShare.create(artwork_id: artwork_id, viewer_id: rand(50..100))
end 

puts "Done!"


end