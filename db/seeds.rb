User.destroy_all



users = [
  { email: "fredesousa7@gmail.com", password: 'password', level: :debutant , habit: '4'},
  { email: "amael.lathes@gmail.com", password: "password", level: :intermediaire , habit: '6' },
  { email: "larrieu.aurelien@gmail.com", password: "password", level: :avance ,habit: '8' },
  { email: "delvigjon@hotmail.fr", password: "password", level: :debutant , habit: '4' },
]

users.each do |user_params|
  User.create!(user_params)
end

puts "Created #{User.count} users"