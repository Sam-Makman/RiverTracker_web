# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create!(name:  "Sam Makman",
             email: "sammakman@gmail.com",
             password:              "password",
             password_confirmation: "password",
             admin: true)
User.create!(name:  "Liz Lemon",
             email: "lemon@nbc.com",
             password:              "password",
             password_confirmation: "password")
User.create!(name:  "Tracy Jordan",
             email: "tracy@nbc.com",
             password:              "password",
             password_confirmation: "password")



River.create(name:'White Salmon', section:'Green Truss', difficulty:'V', usgs_id:12345678, user_id: 1, state: "WA")
River.create(name:'Canyon Creek', section:'Fly Creek To Merwin Res', difficulty:'V', usgs_id:12345678, user_id: 1, state: "WA")

User.first.active_relationships.create(favorited_id:1)
User.first.active_relationships.create(favorited_id:2)