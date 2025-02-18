# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

Booking.destroy_all
Lesson.destroy_all
User.destroy_all

# Create Users (Training Partners)
goku = User.create!(
  name: "Goku",
  email: "goku@example.com",  # Required by Devise
  password: "password123",    # Required by Devise
  bio: "Saiyan warrior, always seeking stronger opponents.",
  experience: "Mastered Ultra Instinct",
  specialties: "Martial Arts, Ki Control, Super Strength"
)

bruce_lee = User.create!(
  name: "Bruce Lee",
  email: "bruce@example.com",  # Required by Devise
  password: "password123",      # Required by Devise
  bio: "Martial arts legend and creator of Jeet Kune Do.",
  experience: "Master of Jeet Kune Do",
  specialties: "Speed, Agility, Combat Strategy"
)

# Create Lessons
goku_lesson = Lesson.create!(
  title: "Train with Goku in the Hyperbolic Time Chamber",
  description: "Push your limits with Goku's Saiyan-style training.",
  duration: 600,
  location: "Hyperbolic Time Chamber",
  price: 50,
  capacity: 2,
  user: goku
)

bruce_lee_lesson = Lesson.create!(
  title: "Jeet Kune Do Masterclass with Bruce Lee",
  description: "Learn Jeet Kune Do techniques and philosophy with the master himself.",
  duration: 600,
  location: "Dojo",
  price: 75,
  capacity: 3,
  user: bruce_lee
)

# Create Bookings
booking = Booking.new(
  start_time: Time.now + 3.days,
  status: "accepted",
  participants: 1,
  user: goku, # Simulating Goku booking Bruce Lee’s lesson
)

booking.lesson = bruce_lee_lesson
booking.save
booking2 = Booking.new(
  start_time: Time.now + 5.days,
  status: "pending",
  participants: 2,
  user: bruce_lee, # Simulating Bruce Lee booking Goku’s lesson
)

booking2.lesson = goku_lesson
booking2.save
puts "Seed data for Goku and Bruce Lee created successfully!"
