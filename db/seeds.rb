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

User.create(email: ADMIN_EMAIL,
            password: ADMIN_PASSWORD,
            name: 'Shahid',
            admin: true)

User.create(email: 'example@example.com',
            password: 'password',
            name: Faker::Zelda.character,
            admin: false)

User.create(email: 'test@test.com',
            password: 'password',
            name: Faker::Zelda.character,
            admin: false)

spaces = []
2.times do
  space = Space.create(name: Faker::Lorem.word,
                       description: Faker::Lorem.sentences(1),
                       location: Faker::Address.community)
  spaces.push(space)
end

areas = []
3.times do
  area = Area.create(name: Faker::Lorem.word,
                     description: Faker::Lorem.sentences(1),
                     space: spaces.sample
  )
  areas.push(area)
end

items = []
4.times do
  item = Item.create(name:Faker::Zelda.item,
                     description: Faker::Lorem.sentences(1),

                     )
end