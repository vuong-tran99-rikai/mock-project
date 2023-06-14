require 'faker'
# User.create!(name: 'admin',
#              email: 'admin@example.com',
#              password: 'admin',
#              password_confirmation: 'admin',
#              status: :opened,
#              type_account: :admin
#             )


# 99.times do |n|
#   name = Faker::Name.name
#   email = "example-#{n + 1}@railstutorial.org"
#   password = 'password'
#   User.create!(name: name,
#                email: email,
#                password: password,
#                password_confirmation: password,
#                status: 0,
#                type_account: 0
#               )
# end

99.times do |n|
  name = Faker::Name.name,
  description = "example-#{n + 1}"
  author = 'NNN'
  img = 'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b6/Image_created_with_a_mobile_phone.png/640px-Image_created_with_a_mobile_phone.png'
  Book.create!(name_book: name,
               description: description,
               author: author,
               quantity: 10,
               price: 100000,
               image: img,
               category_id: 1,
               status: 0
              )
end
