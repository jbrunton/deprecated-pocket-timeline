# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Timeline.create(
  title: 'World War II',
  description: 'Events of the Second World War',
  events: [
    Event.create(
      title: 'Germany invades Poland',
      date: DateTime.new(1939, 9, 1)
    ),
    Event.create(
      title: 'Britain goes to war',
      date: DateTime.new(1939, 9, 3)
    ),
    Event.create(
      title: 'Pearl Harbor',
      date: DateTime.new(1941, 12, 7)
    ),
    Event.create(
      title: 'Germany surrenders',
      description: 'Germany signs the German Instrument of Surrender',
      date: DateTime.new(1945, 5, 7)
    ),
    Event.create(
      title: 'Japan surrenders',
      date: DateTime.new(1945, 9, 2)
    )
  ]
)
