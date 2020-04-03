User.create!(user_name: "Example User",
             name:  "Example User",
             email: "example@gmail.com",
             password:              "foobar",
             password_confirmation: "foobar",
             introduction: "初めまして！",
             admin: true)

99.times do |n|
  user_name  = Faker::Name.name
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  introduction = "宜しくお願いします！"
  password = "password"
  User.create!(user_name: user_name,
               name:  name,
               email: email,
               introduction: introduction,
               password:              password,
               password_confirmation: password)
end