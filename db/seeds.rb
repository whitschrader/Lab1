# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.delete_all

m = User.create(:name => 'Markus',  email: "mguehrs@gmail.com", password: "foobar123", password_confirmation: "foobar123")
r = User.create(:name => 'Whit', :email => "whit.schrader@gmail.com", :password => "asdasd", :password_confirmation => "asdasd")
