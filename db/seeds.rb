# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
# require 'open_uri_redirections'
# require 'nokogiri'
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
TAGS = ["1er", "2eme", "3eme", "4eme", "5eme", "6eme", "7eme", "8eme", "9eme", "10eme", "11eme", "12eme", "13eme", "14eme", "15eme", "16eme", "17eme", "18eme", "19eme", "20eme"]

puts 'Cleaning databasessss...'
School.destroy_all
Toy.destroy_all
User.destroy_all
Transaction.destroy_all


puts 'Scrapping schools hahaha (evil laugh)'

store = []
TAGS.each do |tag|
  html_doc = Nokogiri::HTML(open("http://ecolesprimaires.fr/75/paris/#{tag}"))
  # number_school = html_doc.search('.section .itemlist .address').length
  # number_school.each do |school|
  # p html_doc.search('.section .itemlist .title a').text
  html_doc.search('.section .itemlist .address').each do |info|
    school = {}
    school[:name] = info.search('span')[1].text
    school[:address] = info.search('span[itemprop="streetAddress"]').text
    school[:zipcode] = info.search('span[itemprop="postalCode"]').text
    school[:city] = info.search('span[itemprop="addressLocality"]').text
    school[:country] = "France"
    store << school
  end
  # next_page = html_doc.search('.pagination a[rel="next"]')
  # if next_page.empty?
  #   store.each do |school|
  #     School.create(school)
  #     puts "#{store.length} schools created"
  #   end
  # else
  #   p next_page.attribute('href')
  #   p link = open("http://ecolesprimaires.fr#{next_page.attribute('href')}")
  # end
end

store.each do |school|
  School.create(school)
end
puts "#{store.length} schools imported"

puts 'Import 200 beautiful kids'

200.times do
  user = User.new ({
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    password: "123456",
    password_confirmation: "123456"
    })
  user.school = School.all.sample
  user.save
end
puts 'They are all yours'

puts 'Invoke pokemons'

1000.times do
  toy = Toy.new ({
    name: Faker::Pokemon.name,
    price: (1..100).to_a.sample,
    category: "card",
    description: Faker::Pokemon.location
    })
  toy.user = User.all.sample
  toy.save
end

puts 'Catch\'em all'
