class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :bookings
  has_many :lessons
  has_many :reviews, through: :lessons
  validates :name, presence: true, uniqueness: true
  validates :bio, length: { minimum: 10, maximum: 360 }
  validates :experience, length: { minimum: 10, maximum: 500 }
  validates :specialties, length: { minimum: 10, maximum: 200 }
  has_many :photos
end
