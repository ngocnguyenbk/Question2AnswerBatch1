# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create!(username: "exampleuser",
             email: "example@railstutorial.org",
             password:    "123456",
             fullname: "Nguyen Thi Anh Duong" 
            )

50.times do |n|
  username  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "123456"
  User.create!(username:  username,
               email: email,
               password: password,
               fullname: "Nguyen Thi Anh Duong")
end

users = User.order(:created_at).take(6)
50.times do |n|
  title =  "Rails tutorial"
  content = Faker::Lorem.sentence(5)
  view = n + 1
  users.each { |user| user.questions.create!(title: title, content: content, view: view) }
end


questions = Question.all
user_id = User.all.to_a.sample.id
voteable_type = "Questions"
voteable_id = Question.all.to_a.sample.id
questions.each { |question| question.votes.create!(voteable_type: voteable_type, voteable_id: voteable_id, user_id: user_id)}
