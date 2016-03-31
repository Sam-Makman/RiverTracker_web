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
User.create!(name:  "Tyler Moody",
             email: "tmoody@lclark.edu",
             password:              "password",
             password_confirmation: "password",
              admin: true)




River.create(name:'White Salmon',
             section:'Green Truss',
             difficulty:'V',
             usgs_id:14123500,
             user_id: 1,
             state: "WA",
              cfs: 1700,
             approved:true)
River.create(name:'Canyon Creek',
             section:'Fly Creek To Merwin Res',
             difficulty:'V',
             usgs_id:14219000,
             user_id: 1,
             state: "WA",
             cfs:800,
             approved:true)
River.create(name:'E.F. Lewis',
             section:'Sunset to Horseshoe',
             difficulty:'IV',
             usgs_id:14222500,
             user_id: 1,
             state: "WA",
             cfs:1000,
             approved:true)


Alert.create(title: 'Wood Bellow Dragons Back',
            details: 'The gorge bellow dragons back has an unrunnable log jam. You will need to portage above screaming right. you can see the log jam from the top of screaming right',
             river_id: 3)

User.first.active_relationships.create(favorited_id:1)
User.first.active_relationships.create(favorited_id:2)