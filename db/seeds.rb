# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.delete_all

m = User.create(:name => 'Markus',  email: "mguehrs@gmail.com", password: "foobar123", password_confirmation: "foobar123")
w = User.create(:name => 'Whit', :email => "whit.schrader@gmail.com", :password => "asdasd", :password_confirmation => "asdasd")
j = User.create(:name => 'Jane', :email => "jane@gmail.com", :password => "asdasd", :password_confirmation => "asdasd")

Shoe.create(id: 11, size: 9, product_name: 'sambas', brand_name: 'adidas')
Shoe.create(id: 12, size: 10, product_name: 'air jordans', brand_name: 'nike')
Shoe.create(id: 13, size: 10, product_name: 'boots', brand_name: 'timberlands')
m.shoes << Shoe.find(11)
m.shoes << Shoe.find(12)

w.shoes << Shoe.find(11)
w.shoes << Shoe.find(13)
