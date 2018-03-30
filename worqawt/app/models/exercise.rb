class Exercise < ApplicationRecord
  belongs_to :user
  validates :duration, numericality: { greater_than: 0.0 }
  validates :workout, :workout_date, presence: true


  def self.latest_workout
    Exercise.order(workout_date: :desc).first
  end
end
