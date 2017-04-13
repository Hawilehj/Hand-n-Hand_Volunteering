# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(name:  "Example User",
             email: "example@railstutorial.org",
             password:              "foobar",
             password_confirmation: "foobar",
             admin: false,
             activated: true,
             activated_at: Time.zone.now)

User.create!(name:  "Joseph",
             email: "hawilehj@gmail.com",
             password:              "jh2384",
             password_confirmation: "jh2384",
             admin: true,
             activated: true,
             activated_at: Time.zone.now)

User.create!(name:  "Mitchell Koop",
             email: "mkoop@asu.edu",
             password:              "km0bfc",
             password_confirmation: "km0bfc",
             admin: false,
             activated: true,
             activated_at: Time.zone.now)

User.create!(name:  "Mitchell Koop",
             email: "Mitchell.Koop@asu.edu",
             password:              "fa01bc",
             password_confirmation: "fa01bc",
             admin: false,
             activated: true,
             activated_at: Time.zone.now)

99.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@asu.edu"
  password = "password"
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password,
               activated: true,
               activated_at: Time.zone.now)
end

20.times do |a|
  name = Faker::Name.name
  email = "Org-#{a+1}@gmail.com"
  password = "password"
  Organization.create!(
      name: name,
      email: email,
      password: password,
      password_confirmation: password
  )
end

5.times do |b|
  title = "Help at job-#{b+1}"
  text = "Entry text"
  job_type = "hospital"
Job.create!(
       title: title,
       text: text,
       job_type: job_type,
       date: Time.zone.now
)
end