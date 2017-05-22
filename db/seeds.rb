# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
# require 'open_uri_redirections'
# require 'nokogiri'
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# TAGS = [1er, 2eme, 3eme, 4eme, 5eme, 6eme, 7eme, 8eme, 9eme, 10eme, 11eme, 12eme, 13eme, 14eme, 15eme, 16eme, 17eme, 18eme, 19eme, 20eme]

# TAGS = ["1er"]

# store = {}

# TAGS.each do |tag|
#   html_doc = Nokogiri::HTML(open("http://ecolesprimaires.fr/75/paris/#{tag}"))
#   # number_school = html_doc.search('.section .itemlist .address').length
#   # number_school.each do |school|
#   store[:name] = html_doc.search('.section .itemlist .title a').text

# end

puts 'Cleaning database...'
School.destroy_all

puts 'New Schools'
title = ["École élémentaire publique Arbre Sec", "École élémentaire publique Argenteuil", "École maternelle publique Saint-Germain l'Auxerrois", "École maternelle publique Sourdière"]
address = ["15 Rue de l'Arbre Sec", "11 Rue d'Argenteuil", "6 Rue Saint-Germain l'Auxerrois", "27 Rue de la Sourdière"]

title.each_index do |index, t|
  School.create({
    name: title[index],
    address: address[index],
    zipcode: 75001,
    city: "Paris",
    country: "France"})
end

puts '4 schools inserted!'


