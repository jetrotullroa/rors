class Exercise < ApplicationRecord
  belongs_to :user
  validates :duration, numericality: { greater_than: 0.0 }
  validates :workout, :workout_date, presence: true
end
