# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Animal.destroy_all
Animal.create!(
  animal: 'horse_js',
  tweet: "as much as I want to be, I'm not @horse_js",
  photo: 'https://pbs.twimg.com/profile_images/1844491454/horse-js_400x400.png',
  days: '7 days'
)
