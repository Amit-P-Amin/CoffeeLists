# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

Item.create([
  {
    title: 'Exercise',
    content: 'Need to build strength and endurance to keep up with Lydia.',
    position: 0,
    children_attributes: [
      {
        title: 'Go Running',
        content: 'At least 1 mile.',
        position: 0
      },
      {
        title: 'Do Lydia Launches',
        content: 'Throw her in the air 50 times.',
        position: 1,
      }
    ]
  },
  {
    title: 'Ego Deflation',
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
        content: 'Javascript game would be a useful addition to my portfolio, but is only 30% done.',
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
  },
  {
    title: 'Eat Pizza',
    content: 'Need to gain weight.',
    position: 3,
  }
])
