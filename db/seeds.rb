User.create!(name: "Stella Njage",
              email: "ste@njage.com",
              password: "rainbow",
              password_confirmation: "rainbow",
              admin: true)
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
