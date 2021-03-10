require 'csv'
require 'faker'

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
EventMood.destroy_all
Mood.destroy_all

#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
moods = ['Adventurous', 'Social', 'Creative','Peaceful','Energized','Cheerful','Romantic','Reflective','Playful','Powerful','Curious','Inspired']
moods.each do |mood|
	Mood.create!(name: mood)
end