# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'


ADMIN_EMAIL = ENV['SOAP_ADMIN_EMAIL']
ADMIN_PASSWORD = ENV['SOAP_ADMIN_PASSWORD']

users = []
admin = User.create(email: "#{ADMIN_EMAIL}",
                    password: "#{ADMIN_PASSWORD}",
                    name: 'Shahid',
                    admin: true)
pp admin
users.push(admin)
userOne = User.create(email: 'example@example.com',
                      password: 'password',
                      name: Faker::Zelda.character,
                      admin: false)
pp userOne
users.push(userOne)

userTwo = User.create(email: 'test@test.com',
                      password: 'password',
                      name: Faker::Zelda.character,
                      admin: false)
pp userTwo
users.push(userTwo)

spaces = []
2.times do
  space = Space.create(name: Faker::Lorem.word,
                       description: Faker::Lorem.sentences(1)[0],
                       location: Faker::Address.community)
  spaces.push(space)
end

pp spaces

4.times do
  SpaceUser.create(space: spaces.sample,
                   user: users.sample)
end

areas = []
3.times do
  area = Area.create(name: Faker::Lorem.word,
                     description: Faker::Lorem.sentences(1)[0],
                     space: spaces.sample
  )
  areas.push(area)
end

pp areas

items = []
4.times do
  item = Item.create(name: Faker::Zelda.item,
                     description: Faker::Lorem.sentences(1)[0],
                     quantity: rand(1..10),
                     unit: Faker::Measurement.height("all"),
  )
  items.push(item)
end

pp items

4.times do
  AreaItem.create(area: areas.sample,
                  item: items.sample,
                  status: 1)
end
