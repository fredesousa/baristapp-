require 'net/http'
require 'open-uri'
require 'faker'
require 'json'

# Configure Faker locale to French
Faker::Config.locale = 'fr'

# Cleanup existing data
Preference.destroy_all
Favorite.destroy_all
Review.destroy_all
User.destroy_all
Coffee.destroy_all

# Define users
users = [
  { email: "fredesousa7@gmail.com", password: 'password', user_name: 'Fred', level: :debutant, habit: '4', photo_url: "https://res.cloudinary.com/du3ec0enc/image/upload/v1721729778/fred_pic_swnin5.jpg" },
  { email: "amael.lathes@gmail.com", password: "password", user_name: 'Amael', level: :avance, habit: '6', photo_url: "https://res.cloudinary.com/du3ec0enc/image/upload/v1721729778/amael_pic_vba98h.jpg" },
  { email: "delvigjon@hotmail.fr", password: "password", user_name: 'Jonathan', level: :intermediaire, habit: '4', photo_url: "https://res.cloudinary.com/du3ec0enc/image/upload/v1721729779/Jon_pic_jxhv0v.jpg" }
]

# Create users
users.each do |user|
  photo_url = user[:photo_url]
  user_instance = User.new(
    email: user[:email],
    password: user[:password],
    user_name: user[:user_name],
    level: user[:level],
    habit: user[:habit]
  )
  photo_file = URI.open(photo_url)
  user_instance.photo.attach(io: photo_file, filename: "#{user[:user_name]}.jpg", content_type: "image/jpg")
  user_instance.save!
end

puts "Created #{User.count} users"

puts "Start coffee seed"

# Fetch coffee data from the API
uri = URI('https://fake-coffee-api.vercel.app/api')
response = Net::HTTP.get(uri)
data = JSON.parse(response)

# Loop to create 100 coffee instances
100.times do
  coffee_data = data.sample # Random coffee data from the API

  # Generate a random coffee using Faker and the API image
  coffee = Coffee.create!(
    name: Faker::Coffee.blend_name,
    description: Faker::Coffee.notes,
    origin: Coffee::ORIGINS.sample,
    brewing_method: Coffee::BREWING_METHODS.sample,
    strength: rand(1..10),
    coffee_type: Coffee::COFFEES_TYPE.sample,
    machin_type: Coffee::MACHINS_TYPE.sample,
    price: rand(5.0..30.0).round(2) # Random price between 5.0 and 30.0
  )

  # Attach image from the API
  image_url = coffee_data['image_url']
  photo_file = URI.open(image_url)
  coffee.photo.attach(io: photo_file, filename: "#{coffee.name}.png", content_type: "image/png")
  coffee.save!

  # Add 3 random reviews for each coffee
  3.times do
    Review.create!(
      coffee: coffee,
      user: User.all.sample,
      description: Faker::Coffee.notes,
      rating: rand(1..5)
    )
  end
end

puts "Created #{Coffee.count} coffees"
puts "Created #{Review.count} reviews"
