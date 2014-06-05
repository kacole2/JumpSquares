# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


firstadmin = User.create(:email => "admin@jumpsquares.net", :password => "jump123", :password_confirmation => "jump123", :confirmed_at => Time.now)
firstadmin.add_role :admin
puts "creating the first admin user admin@jumpsquares.net"
