# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

iranian_revolution = Event.create(title: 'Islamic Revolution of Iran', description: 'Overthrow of the Shah')
iranian_revolution_timeline = Timeline.create(title: 'Islamic Revolution of Iran', description: 'Overthrow of the Shah')
iranian_revolution_timeline.events.push iranian_revolution
