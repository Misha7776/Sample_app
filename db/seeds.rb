User.create!(name:  "Misha Push",
             email: "vmisha7776@gmail.com",
             password:              "19972412",
             password_confirmation: "19972412",
             admin: true)

99.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password)
end