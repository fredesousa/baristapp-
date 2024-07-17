require "open-uri"

User.destroy_all
Coffee.destroy_all

users = [
  { email: "fredesousa7@gmail.com", password: 'password', user_name: 'Fred', level: :debutant , habit: '4'},
  { email: "amael.lathes@gmail.com", password: "password", user_name: 'Amael', level: :intermediaire , habit: '6' },
  { email: "larrieu.aurelien@gmail.com", password: "password", user_name: 'Aurelien', level: :avance ,habit: '8' },
  { email: "delvigjon@hotmail.fr", password: "password", user_name: 'Jonathan', level: :debutant , habit: '4' },
]

users.each do |user_params|
  User.create!(user_params)
end

puts "Created #{User.count} users"

coffees = [
  { name: "São João", origin: "Bresil", roaster: "Café du Monde", description: "Issu des luxuriantes vallées tropicales de la région du Minas Gerais, au Sud du Brésil, le São João possède tous les codes des cafés typiquement brésiliens. Équilibré à souhait, il est le café le plus gourmand de notre sélection. De belles notes de cacao et de caramel en début de tasse laissent place à une touche d’amande grillée en fin de bouche. Très rond, il est le café du matin par excellence… 100% Arabica & Biologique", strength: 5, coffee_type: "Arabica", machin_type: "Espresso", photo_url: "https://res.cloudinary.com/du3ec0enc/image/upload/v1721133046/Sao-Joao-Bresil-Cafes-du-Monde-_fir6oc.png"},
  { name: "ETHIOPIA - YIRGACHEFE", origin: "Ethiopie", roaster: "La Colombe", description: "Tous les cafés du monde proviennent de plantes qui poussaient à l’origine à l’état sauvage dans les hautes terres d’Éthiopie. Dans le berceau du café, la région de Yirgachefe est mondialement connue pour ses cafés aux arômes floraux et fruités distinctifs. Grâce à des techniques de traitement modernes, ce café a été trié trois fois par taille, couleur et densité jusqu’à ce que le produit final atteigne un point proche de la perfection. Cette expression pure du café ancien ne ressemble à aucune autre.", strength: 4, coffee_type: "Arabica", machin_type: "Filtre", photo_url: "https://res.cloudinary.com/du3ec0enc/image/upload/v1721133046/La-colombe_ghlkrp.webp" },
  { name: "HONDURAS LA PILA", origin: "Honduras", roaster: "Intelligentsia", description: "Il s'agit de notre deuxième lancement consécutif de nos partenaires de longue date du commerce direct chez Bon Café. Il a été cultivé par l'Allemand Antonio Mejia dans sa ferme La Pila à Lempira, au Honduras, une région réputée pour ses cafés de haute qualité. Sa ferme possède plusieurs variétés, dont le Bourbon et deux hybrides Cattura : Lempira et IHCAFE 90", strength: 5, coffee_type: "Arabica", machin_type: "Chemex", photo_url: "https://res.cloudinary.com/du3ec0enc/image/upload/v1721133412/Honduras-La-Pila_hero_hnz2jc.avif" },
  { name: "Guatemala El Injerto Bourbon", origin: "Guatemala", roaster: "Stumptown", description: "Depuis des décennies, la famille Aguirre de Finca El Injerto repousse les limites de la qualité, de l'innovation et des pratiques agricoles durables pour produire ce café d'origine unique complexe et toujours délicieux.", strength: 4, coffee_type: "Arabica", machin_type: "Espresso", photo_url:"https://res.cloudinary.com/du3ec0enc/image/upload/v1721133046/Guatemala-El-Injerto_Product-Image-Transparent-PNG_EDIT_2_sijlpb.avif" },
  { name: "DATERRA SUNDROP", origin: "Bresil", roaster: "George Howell Coffee", description: "Le propriétaire de Daterra, Luis Pascoal, est un visionnaire clé du mouvement de qualité du café qui ne se lasse jamais de peaufiner tout ce qu’il fait pour améliorer ses cafés et ses politiques sociales et environnementales. Daterra a été la première ferme au monde à conditionner ses cafés bruts dans des emballages scellés, préservant ainsi les nuances subtiles de son café au cours du long voyage océanique jusqu’à nos côtes", strength: 5, coffee_type: "Robusta", machin_type: "Espresso", photo_url: "https://res.cloudinary.com/du3ec0enc/image/upload/v1721133046/DaterraSundropt_mu2ctj.webp" },
  { name: "Café Beaubourg", origin: "Panama", roaster: "Madcap Coffee", description: "Situé près du Centre Pompidou, idéal pour une pause culturelle.", strength: 4, coffee_type: "Arabica", machin_type: "Filtre", photo_url: "https://res.cloudinary.com/du3ec0enc/image/upload/v1721133046/Guatemala-El-Injerto_Product-Image-Transparent-PNG_EDIT_2_sijlpb.avif" },
]

coffees.each do |coffee_params|
  coffee = Coffee.new(
    name: coffee_params[:name],
    origin: coffee_params[:origin],
    roaster: coffee_params[:roaster],
    description: coffee_params[:description],
    strength: coffee_params[:strength],
    coffee_type: coffee_params[:coffee_type],
    machin_type: coffee_params[:machin_type]
  )
  photo_url = coffee_params[:photo_url]
  photo_file = URI.open(photo_url)
  coffee.photo.attach(io: photo_file, filename: "#{coffee.name}.jpg", content_type: "image/jpg")
  coffee.save!
end
