# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Item.create([
  {
    title: 'Exercise',
    content: 'Do arm exercises for 30 minutes every other day.',
    position: 0
  },
  {
    title: 'Comfort Zone Expansion',
    content: 'Go outside and ask strangers if they think I am beautiful.',
    position: 1
  },
  {
    title: 'Make Money',
    content: 'Savings will only last for another 2 months, so get a job!',
    position: 2,
    children_attributes: [
      {
        title: 'Finish Javascript Game',
        content: 'Javascript game would be a useful addition to portfolio, but is only 30% done.',
        position: 0
      },
      {
        title: 'Get More Offers',
        content: 'I already have an offer from Google. But... who wants one of those? Get an offer from a better company, like LaneEver.',
        position: 1,
        children_attributes: [
          title: 'Apply to More Companies',
          content: 'Send out at least 100 applications in the next week.',
          position: 0,
        ]
      }
    ]
  }
])
