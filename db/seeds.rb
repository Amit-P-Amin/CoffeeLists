# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Item.create([
  {
    title: 'Item 1',
    content: 'Item 1 swoops in for the win',
    position: 0
  },
  {
    title: 'Item 2',
    content: 'Item 2 has no idea what he is doing',
    position: 1
  },
  {
    title: 'Item 3',
    content: 'Item 3 is a list of wholesome goodness',
    position: 2,
    children_attributes: [
      {
        title: 'Item 3.1',
        content: 'I am a child',
        position: 0
      },
      {
        title: 'Item 3.2',
        content: 'I am another child',
        position: 1
      }
    ]
  }
])
