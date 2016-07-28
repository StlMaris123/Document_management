User.create!(name: "Stella Njage",
              email: "ste@njage.com",
              password: "rainbow",
              password_confirmation: "rainbow",
              admin: true)
100.times do |d|
  title = Faker::Book.title
  link  = Faker::Internet.url
  tag   = Faker::Book.genre
  department = Faker::Commerce.department(5)
    Document.create!(title: title,
                     link: link,
                     tag: tag,
                     department: department )
    puts "#{title}, "
end
