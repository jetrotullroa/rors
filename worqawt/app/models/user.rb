class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :first_name, :last_name, presence: true

  has_many :exercises

  def full_name
    if first_name.nil? || last_name.nil?
      "#{email}"
    else
      "#{first_name} #{last_name}"
    end
  end

  def self.has_workout
    User.includes(:exercises).where.not(exercises: { id: nil })
  end

  def self.search_by_name(name)
    names_array = name.split(' ')

    if names_array.size == 1
      where('first_name LIKE ? or last_name LIKE ?',
        "%#{names_array[0]}%", "%#{names_array[0]}%"
      ).order(:first_name)
    else
      where('first_name LIKE ? or first_name LIKE ? or last_name LIKE ? or last_name LIKE ?',
        "%#{names_array[0]}", "%#{names_array[1]}%", "%#{names_array[0]}%", "%#{names_array[1]}%"
      ).order(:first_name)
    end
  end
end
