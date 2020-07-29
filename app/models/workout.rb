class Workout < ApplicationRecord
  belongs_to :user
  has_many :trainings
  has_many :events, through: :trainings
  validates_associated :trainings
  validates :name, uniqueness: true
  validates :category, :duration, :intensity, presence: true
  validates :duration, numericality: true
  validates :intensity, numericality: { greater_than: 0, less_than: 6 }

end
