class User < ApplicationRecord
  has_secure_password
  mount_uploader :user_img, ImageUploader

  has_many :reservations, dependent: :destroy
  has_many :rooms, dependent: :destroy

  validates :username, { presence: true, length: { maximum: 20 } }
  validates :introduction, length: { maximum: 500 }
  validates :email, { presence: true }
  validates :password, presence: true, length: { minimum: 8 }, on: :create
  validates :password, presence: true, length: { minimum: 8 }, on: :update
  validates :password, length: { minimum: 8 }, on: :change_profile, allow_blank: true
end
