User.create!(
  name:  "Admin",
  email: "admin2@user.com",
  password:              "admin1",
  password_confirmation: "admin1",
  admin:     true,
)


99.times do |n|
  name = Faker::Name.name
  email = Faker::Internet.free_email 
  password = Faker::Internet.password
  User.create!(
    name: name,
    email: email,
    password: password,
    password_confirmation: password,
    admin: [true, false].sample
  )
end

99.times do |n|
  title = Faker::Games::Pokemon.name
  random = [1, 2, 3, 4, 5].sample
  description = Faker::Lorem.paragraph(sentence_count: random)
  price = Faker::Number.decimal_part(digits: random)
  Good.create!(
    title: title,
    description: description,
    price: price
  )
end
