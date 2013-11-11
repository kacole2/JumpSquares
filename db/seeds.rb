# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#create the jumpsize settings
Jumpsize.create(:size => "medium", :length1 => 20, :length2 => 22, :itemsperpage => 100)
puts "creating the first jumpsize"