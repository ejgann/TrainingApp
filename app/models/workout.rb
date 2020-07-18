class Workout < ApplicationRecord
  belongs_to :user
  has_many :trainings
  has_many :events, through: :trainings
  validates_associated :trainings
  validates :name, uniqueness: true
end
