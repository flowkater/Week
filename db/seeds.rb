# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


user = User.create!( email: "test1@naver.com", password: "test1004", password_confirmation: "test1004" )
user.weekplans.create!( public_all: true, public_friends: false, progress_rate: 30)
user.weekplans.first.todos.create!( title: "First", todo_check: false)
user.weekplans.first.todos.create!( title: "Second", todo_check: false)
user.weekplans.first.todos.create!( title: "Third", todo_check: false)


user2 = User.create!( email: "test2@naver.com", password: "test1004", password_confirmation: "test1004" )
user2.weekplans.create!( public_all: true, public_friends: false, progress_rate: 30)
user2.weekplans.first.todos.create!( title: "First", todo_check: false)
user2.weekplans.first.todos.create!( title: "Second", todo_check: false)
user2.weekplans.first.todos.create!( title: "Third", todo_check: false)

user3 = User.create!( email: "test3@naver.com", password: "test1004", password_confirmation: "test1004" )
user3.weekplans.create!( public_all: true, public_friends: false, progress_rate: 30)
user3.weekplans.first.todos.create!( title: "First", todo_check: false)
user3.weekplans.first.todos.create!( title: "Second", todo_check: false)
user3.weekplans.first.todos.create!( title: "Third", todo_check: false)

user4 = User.create!( email: "test4@naver.com", password: "test1004", password_confirmation: "test1004" )
user4.weekplans.create!( public_all: true, public_friends: false, progress_rate: 30)
user4.weekplans.first.todos.create!( title: "First", todo_check: false)
user4.weekplans.first.todos.create!( title: "Second", todo_check: false)
user4.weekplans.first.todos.create!( title: "Third", todo_check: false)