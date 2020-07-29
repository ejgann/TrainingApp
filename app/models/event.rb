class Event < ApplicationRecord
  belongs_to :user
  has_many :trainings
  has_many :workouts, through: :trainings
  validates :title, :category, :description, :length, presence: true
  validates :length, numericality: true
end
