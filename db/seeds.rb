
Staff.create!(
  name:  "Admin",
  email: "admin@admin.com",
  password:              "admin123",
  password_confirmation: "admin123",
  super_admin:     true,
)


User.create!(
  name:  "Admin",
  email: "admin2@user.com",
  password:              "admin1",
  password_confirmation: "admin1",
)

10.times do |n|
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



10.times do |n|
  name = Faker::Name.name
  email = Faker::Internet.free_email 
  password = Faker::Internet.password
  Staff.create!(
    name: name,
    email: email,
    password: password,
    password_confirmation: password,
    super_admin: [true, false].sample
  )
end

6.times do |n|
  title = Faker::Food.dish
  random = [3, 4, 5].sample
  description = Faker::Food.description
  price = Faker::Number.decimal_part(digits: random)
  Product.create!(
    title: title,
    description: description,
    price: price
  )
end

6.times do |n|
  title = Faker::House.furniture
  random = [2, 3, 4, 5].sample
  description = Faker::Lorem.paragraph(sentence_count: random)
  price = Faker::Number.decimal_part(digits: random)
  Product.create!(
    title: title,
    description: description,
    price: price
  )
end

6.times do |n|
  title = Faker::Book.title
  random = [2, 3, 4, 5].sample
  description = Faker::Lorem.paragraph(sentence_count: random)
  price = Faker::Number.decimal_part(digits: random)
  Product.create!(
    title: title,
    description: description,
    price: price
  )
end

6.times do |n|
  title = Faker::Tea.type
  random = [2, 3, 4, 5].sample
  description = Faker::Lorem.paragraph(sentence_count: random)
  price = Faker::Number.decimal_part(digits: random)
  Product.create!(
    title: title,
    description: description,
    price: price
  )
end

6.times do |n|
  title = Faker::Drone.name  
  random = [2, 3, 4, 5].sample
  description = Faker::Lorem.paragraph(sentence_count: random)
  price = Faker::Number.decimal_part(digits: random)
  Product.create!(
    title: title,
    description: description,
    price: price
  )
end

6.times do |n|
  title = Faker::Camera.brand_with_model 
  random = [3, 4, 5].sample
  description = Faker::Lorem.paragraph(sentence_count: random)
  price = Faker::Number.decimal_part(digits: random)
  Product.create!(
    title: title,
    description: description,
    price: price
  )
end

6.times do |n|
  title = Faker::Movie.title
  random = [3, 4, 5].sample
  description = Faker::Lorem.paragraph(sentence_count: random)
  price = Faker::Number.decimal_part(digits: random)
  Product.create!(
    title: title,
    description: description,
    price: price
  )
end