class Exercise < ApplicationRecord
  validates :duration, :workout, presence: true
  belongs_to :user
end
