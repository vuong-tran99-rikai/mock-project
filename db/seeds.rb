require 'faker'
User.create!(name: 'admin',
             email: 'admin@example.com',
             password: 'admin',
             password_confirmation: 'admin',
             status: :opened,
             type_account: 1
            )


# 99.times do |n|
#   name = Faker::Name.name
#   email = "example-#{n + 1}@railstutorial.org"
#   password = 'password'
#   User.create!(name: name,
#                email: email,
#                password: password,
#                password_confirmation: password,
#                status: :opened
#               )
# end