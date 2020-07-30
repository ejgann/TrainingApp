class Workout < ApplicationRecord
  belongs_to :user
  has_many :trainings
  has_many :events, through: :trainings
  validates_associated :trainings
  validates :name, uniqueness: true
  validates :category, :duration, :intensity, presence: true
  validates :duration, numericality: true
  validates :intensity, numericality: { greater_than: 0, less_than: 6 }

# scope method
  scope :most_popular, -> { Workout.joins(:trainings).group(:id).order("count(workout_id) desc") }
  # want to order the 'all workouts' view by popularity (i.e. number of trainings associated with that workout)
  # to count the number of trainings of an associated workout => @workout.trainings.count
  # .order -- desc
  # because it involves a join table, we have to incorporate joins + model into the scope method

end
