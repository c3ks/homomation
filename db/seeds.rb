# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

locations = Location.create([{ name: 'Raum 1' }, { name: 'Raum 2'} ])

devices = Device.create([{ name: 'Thermometer', location: locations.first }, { name: 'Lichtsensor', location: locations.first }, { name: 'Lichtsensor', location: locations.last }])
