User.create!(name: "Stella Njage",
              email: "ste@njage.com",
              password: "rainbow",
              password_confirmation: "rainbow",
              admin: true,
              activated: true,
              activated_at: Time.zone.now)
5.times do |n|
  name = Faker::Name.name
  email = "ste-#{n+1}@gmail.com"
  password = "password"
User.create!(name: name,
             email: email,
             password: password,
             password_confirmation: password,
             activated: true,
             activated_at: Time.zone.now)
end
100.times do |d|
  title = Faker::Book.title
  link  = Faker::Internet.url
  tag   = Faker::Book.genre
  departments = ["Operations", "Finance", "IT", "Marketing", "Credit"]
department = departments[rand(5)]
    Document.create!(title: title,
                     link: link,
                     tag: tag,
                     department: department )
    puts "#{title}, "
end
