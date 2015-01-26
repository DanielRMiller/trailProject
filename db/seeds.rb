# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create(username: 'admin', password: 'overlord', user_type: 'admin', email: 'change@this.com', first_name: 'Marc', last_name: 'Blocker')
User.create(username: 'admin2', password: 'overlord', user_type: 'admin', email: 'change@this.com', first_name: 'Chad', last_name: 'Carey')

Region.create(name: 'North America', latitude: 56.746000, longitude: -105.605469, zoom: 3, description: 'North America', history: 'Foo')
Region.create(name: 'South America', latitude: -4.429765, longitude: -55.722656, zoom: 3, description: 'South America', history: 'Foo')
Region.create(name: 'Central America', latitude: 13.442528, longitude: -85.571878, zoom: 5, description: 'Central America', history: 'Foo')
