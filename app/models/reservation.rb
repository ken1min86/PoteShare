require 'date'

class Reservation < ApplicationRecord
  belongs_to :user, foreign_key: 'user_id'
  belongs_to :room, foreign_key: 'room_id'

  validates :start_date, { presence: true }
  validates :end_date, { presence: true }
  validates :num_of_people, presence: true, numericality: { greater_than: 0, only_integer: true }
  validate :end_date_cannot_over_start_date
  validate :start_date_must_over_today

  with_options on: :save do |save|
    save.validates :user_id, { presence: true }
    save.validates :room_id, { presence: true }
    save.validates :sum_of_fee, presence: true, numericality: { greater_than: 0, only_integer: true }
  end

  private

  def end_date_cannot_over_start_date
    errors.add(:end_date, 'must be set start_date or later') if start_date && end_date && (start_date > end_date)
  end

  def start_date_must_over_today
    errors.add(:start_date, 'must be set today or later') if start_date && (start_date < Date.today)
  end
end
