class Event < ApplicationRecord
  belongs_to :user
  has_many :trainings
  has_many :workouts, through: :trainings
  validates_associated :trainings
end
