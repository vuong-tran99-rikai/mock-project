require 'faker'
# User.create!(name: 'Example User',
#              email: 'example@railstutorial.org',
#              password: 'foobar',
#              password_confirmation: 'foobar')


# 99.times do |n|
#   name = Faker::Name.name
#   email = "example-#{n + 1}@railstutorial.org"
#   password = 'password'
#   User.create!(name: name,
#                email: email,
#                password: password,
#                password_confirmation: password)
# end
99.times do
  Category.create(
    name_category: Faker::Lorem.word,
    status: rand(0..1)
  )
end