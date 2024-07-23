require 'net/http'
require "open-uri"
require 'faker'
require "json"

# Configure Faker locale to French
Faker::Config.locale = 'fr'

Preference.destroy_all
Favorite.destroy_all
Review.destroy_all
User.destroy_all
Coffee.destroy_all

users = [
  { email: "fredesousa7@gmail.com", password: 'password', user_name: 'Fred', level: :debutant , habit: '4', photo_url: "https://res.cloudinary.com/du3ec0enc/image/upload/v1721729778/fred_pic_swnin5.jpg"},
  { email: "amael.lathes@gmail.com", password: "password", user_name: 'Amael', level: :intermediaire , habit: '6', photo_url: "https://res.cloudinary.com/du3ec0enc/image/upload/v1721729778/amael_pic_vba98h.jpg" },
  { email: "delvigjon@hotmail.fr", password: "password", user_name: 'Jonathan', level: :debutant , habit: '4', photo_url: "https://res.cloudinary.com/du3ec0enc/image/upload/v1721729779/Jon_pic_jxhv0v.jpg" },
]

users.each do |user|
  photo_url = user[:photo_url]
  user = User.new(
    email: user[:email],
    password: user[:password],
    user_name: user[:user_name],
    level: user[:level],
    habit: user[:habit]
  )
  photo_file = URI.open(photo_url)
  user.photo.attach(io: photo_file, filename: "#{user.user_name}.jpg", content_type: "image/jpg")
  user.save!
end

puts "Created #{User.count} users"

puts "Start coffee seed"

uri = URI('https://fake-coffee-api.vercel.app/api')
response = Net::HTTP.get(uri)
data = JSON.parse(response)

data.each do |coffee_instance|
  image_url = coffee_instance['image_url']
  coffee = Coffee.create!(
    name: Faker::Coffee.blend_name,
    description: Faker::Coffee.notes,
    origin: Coffee::ORIGINS.sample,
    brewing_method: Coffee::BREWING_METHODS.sample,
    strength: rand(1..10),
    coffee_type: Coffee::COFFEES_TYPE.sample,
    machin_type: Coffee::MACHINS_TYPE.sample,
    price: rand(5.0..30.0).round(2) # Prix aléatoire entre 5.0 et 30.0
  )
  photo_file = URI.open(image_url)
  coffee.photo.attach(io: photo_file, filename: "#{coffee.name}.png", content_type: "image/png")
  coffee.save!

  # Ajouter des critiques aléatoires pour chaque café
  3.times do
    Review.create!(
      coffee: coffee,
      user: User.all.sample,
      description: "#{Faker::Coffee.notes}",
      rating: rand(1..5)
    )
  end
end

puts "Created #{Coffee.count} coffees"
puts "Created #{Review.count} reviews"
