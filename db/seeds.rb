# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
require "open-uri"

puts "Cleaning database..."

Booking.destroy_all
Lesson.destroy_all
User.destroy_all

CATEGORIES = ["Martial Arts", "Bodybuilding", "Sprinting", "Boxing", "Endurance", "Combat Training", "Tactical Combat", "Dance"]

puts "Creating trainers..."

trainers = [
  {
    name: "Goku",
    email: "goku@hero.com",
    password: "123123",
    bio: "A Saiyan warrior who constantly pushes his limits, Goku is the embodiment of endurance, strength, and relentless training.",
    experience: "A lifetime of intense training under the strongest masters in the universe.",
    specialties: "Endurance, Strength, Combat",
    category: "Endurance",
    address: "日本, 〒150-0002 東京都渋谷区渋谷２丁目１９番１２号",
    image: "https://miro.medium.com/v2/resize:fit:1400/1*y-YpDxm4uOsulc3Zt_EG7w.png"
  },
  {
    name: "Bruce Lee",
    email: "bruce@hero.com",
    password: "123123",
    bio: "A martial arts pioneer and creator of Jeet Kune Do, Bruce Lee is known for his speed, precision, and philosophy of combat.",
    experience: "Over 20 years of martial arts mastery and combat philosophy.",
    specialties: "Speed, Precision, Agility",
    category: "Martial Arts",
    address: "日本, 〒150-0043 東京都渋谷区道玄坂２丁目１０番１２号",
    image: "https://upload.wikimedia.org/wikipedia/commons/0/02/Bruce-Lee-as-Kato-1967-retouched.jpg"
  },
  {
    name: "Arnold Schwarzenegger",
    email: "arnold@hero.com",
    password: "123123",
    bio: "7-time Mr. Olympia and one of the greatest bodybuilders of all time, Arnold is a master of strength training and muscle development.",
    experience: "Over 30 years in bodybuilding, fitness, and strength training.",
    specialties: "Muscle Growth, Strength, Hypertrophy",
    category: "Bodybuilding",
    address: "日本, 〒150-0043 東京都渋谷区道玄坂１丁目１６番１３号",
    image: "https://upload.wikimedia.org/wikipedia/commons/0/05/Arnold_Schwarzenegger_1974.jpg"
  },
  {
    name: "Lisa (BLACKPINK)",
    email: "lisa@hero.com",
    password: "123123",
    bio: "A world-famous K-pop idol and dancer, Lisa is known for her precision, fluidity, and stage presence in high-energy choreography.",
    experience: "Over a decade of professional dance training and performances.",
    specialties: "Hip-Hop Dance, Flexibility, Rhythm",
    category: "Dance",
    address: "日本, 〒150-0002 東京都渋谷区渋谷１丁目１０番３号",
    image: 'https://upload.wikimedia.org/wikipedia/commons/4/49/Blackpink%27s_Lisa_Manoban_05.jpg'
  },
  {
    name: "Baki Hanma",
    email: "baki@hero.com",
    password: "123123",
    bio: "An underground fighter with extreme combat conditioning, Baki trains to surpass his legendary father, Yujiro Hanma.",
    experience: "Over 10 years of brutal combat training against the world's strongest fighters.",
    specialties: "Grappling, Striking, Combat Durability",
    category: "Combat Training",
    address: "日本, 〒150-0031 東京都渋谷区桜丘町９番１２号",
    image: "https://i.pinimg.com/736x/88/e3/4a/88e34a0b78b1dde29b84845a3f83e144.jpg"
  },
  {
    name: "All Might",
    email: "allmight@hero.com",
    password: "123123",
    bio: "The Symbol of Peace, All Might teaches what it means to be a true hero—both physically and mentally.",
    experience: "Decades of hero work and strength-based combat training.",
    specialties: "Strength, Willpower, Heroic Mindset",
    category: "Bodybuilding",
    address: "日本, 〒150-0036 東京都渋谷区南平台町１３番１０号",
    image: "https://static.wikia.nocookie.net/bokunoheroacademia/images/c/cd/Toshinori_Yagi_Golden_Age_Hero_Costume_%28Anime%29.png"
  },
  {
    name: "Mike Tyson",
    email: "tyson@hero.com",
    password: "123123",
    bio: "A former undisputed heavyweight boxing champion, Tyson is known for his ferocious power and intimidating presence in the ring.",
    experience: "Over 20 years of professional boxing and championship training.",
    specialties: "Power Punching, Footwork, Defense",
    category: "Boxing",
    address: "日本, 〒150-0002 東京都渋谷区渋谷１丁目２３番２１号",
    image: "https://a.espncdn.com/combiner/i?img=%2Fphoto%2F2015%2F0911%2Fbox_a_tyson01jr__r7925_1296x729_16%2D9.jpg&w=920&h=518&scale=crop&cquality=80&location=origin&format=jpg"
  },
  {
    name: "Julio César Chávez",
    email: "chavez@hero.com",
    password: "123123",
    bio: "One of the greatest boxers of all time, Chávez is known for his incredible endurance, iron chin, and relentless fighting style.",
    experience: "Over 25 years in professional boxing, undefeated for 90 fights.",
    specialties: "Endurance, Body Punching, Defense",
    category: "Boxing",
    address: "日本, 〒150-0036 東京都渋谷区南平台町１３番４号",
    image: "https://nyfights.com/wp-content/uploads/2023/08/3FC6CE30-4B8D-42CE-A7B7-C0841B19B607.jpeg"
  },
  {
    name: "Jackie Chan",
    email: "jackie@hero.com",
    password: "123123",
    bio: "A master of martial arts and stunt work, Jackie Chan blends acrobatics, creativity, and discipline into his unique combat style.",
    experience: "Over 40 years of martial arts, stunt choreography, and movie fighting.",
    specialties: "Acrobatics, Improvised Combat, Reflexes",
    category: "Martial Arts",
    address: "日本, 〒150-0043 東京都渋谷区道玄坂２丁目２９番５号",
    image: "https://static.wikia.nocookie.net/tmnt/images/b/b6/Jackiechan.jpg"

  },
  {
    name: "Saitama",
    email: "saitama@hero.com",
    password: "123123",
    bio: "A hero for fun, Saitama's training routine made him the most powerful being, capable of defeating any opponent with a single punch.",
    experience: "Three years of the legendary '100 Pushups, 100 Situps, 100 Squats' routine.",
    specialties: "Power, Speed, Stamina",
    category: "Endurance",
    address: "日本, 〒150-0043 東京都渋谷区道玄坂２丁目２０番９号",
    image: "https://static.wikia.nocookie.net/onepunchman/images/8/81/Saitama_Anime_Profile.png"
  },
  {
    name: "Levi Ackerman",
    email: "levi@hero.com",
    password: "123123",
    bio: "The strongest soldier in humanity, Levi's combat skills, precision, and discipline make him a master of battlefield tactics.",
    experience: "A lifetime of elite soldier training and ODM mastery.",
    specialties: "Agility, Tactical Combat, Precision Strikes",
    category: "Tactical Combat",
    address: "日本, 〒150-0002 東京都渋谷区渋谷３丁目８番１２号",
    image: "https://static.wikia.nocookie.net/attack-vampire/images/2/2d/Levi_Ackermann.png"
  },
  {
    name: "David Goggins",
    email: "goggins@hero.com",
    password: "123123",
    bio: "A former Navy SEAL and ultra-endurance athlete, Goggins pushes the limits of mental and physical endurance through extreme resilience.",
    experience: "Years of SEAL training, ultra-marathons, and pushing past limits.",
    specialties: "Mental Toughness, Endurance, Discipline",
    category: "Endurance",
    address: "日本, 〒150-0043 東京都渋谷区道玄坂２丁目１６番７号",
    image: "https://upload.wikimedia.org/wikipedia/commons/e/e3/DavidGogginsMay08.jpg"
  },
  {
    name: "Usain Bolt",
    email: "usain@hero.com",
    password: "123123",
    bio: "The fastest man in history, Usain Bolt is an Olympic champion known for his explosive speed and unmatched sprinting technique.",
    experience: "Over 15 years of professional sprinting and Olympic competition.",
    specialties: "Sprinting, Acceleration, Endurance",
    category: "Sprinting",
    address: "日本, 〒150-0044 東京都渋谷区円山町２番９号",
    image: "https://upload.wikimedia.org/wikipedia/commons/f/f3/Usain_Bolt_Rio_100m_final_2016k.jpg"
  }
]

trainers.each do |trainer|
  user = User.new(
    name: trainer[:name],
    email: trainer[:email],
    password: trainer[:password],
    bio: trainer[:bio],
    experience: trainer[:experience],
    specialties: trainer[:specialties]
  )

  file = URI.parse(trainer[:image]).open

  user.photo.attach(io: file, filename: "#{trainer[:name]}.png", content_type: "image/png")
  user.save

  Lesson.create!(
    user: user,
    title: "#{trainer[:name]}'s #{trainer[:category]} Class",
    description: "Train with #{trainer[:name]} to master #{trainer[:specialties].downcase}.",
    duration: rand(30..60),
    price: rand(50..150),
    capacity: rand(5..20),
    category: trainer[:category],
    address: trainer[:address]
  )
end

puts "Created #{User.count} trainers with lessons in Shibuya, Tokyo!"
