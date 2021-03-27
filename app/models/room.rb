class Room < ApplicationRecord
  mount_uploader :room_img, ImageUploader

  has_many :reservations, dependent: :destroy
  belongs_to :user, foreign_key: 'user_id'

  validates :roomname, { presence: true, length: { maximum: 20 } }
  validates :introduction, { presence: true, length: { maximum: 500 } }
  validates :fee, presence: true, numericality: { greater_than: 0, only_integer: true }
  validates :address, { presence: true }
  validates :room_img, { presence: true }
  validates :user_id, { presence: true }
end
