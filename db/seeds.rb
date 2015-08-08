# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Category.find_or_create_by(:name => "Bed")
@cat1a = Category.find_by_name('Bed')
SubCategory.find_or_create_by(:name => "Bed sheets", :category_id => @cat1a.id)
SubCategory.find_or_create_by(:name => "Bed in a bag", :category_id => @cat1a.id)

Category.find_or_create_by(:name => "Curtains")
@cat2 = Category.find_by_name('Curtains') 
SubCategory.find_or_create_by(:name => "Window curtains", :category_id => @cat2.id)
SubCategory.find_or_create_by(:name => "Door curtains", :category_id => @cat2.id)

