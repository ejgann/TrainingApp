class Training < ApplicationRecord
  belongs_to :event
  belongs_to :workout
  validates :date, :notes, presence: true
  validates_associated :workout
  

  # this creates a custom writer method called "workout_attributes=(attributes)", which is referenced/used in training_params

  def workout_attributes=(workout_attributes)
    workout = Workout.find_or_create_by(workout_attributes)
    if workout.valid?   
    self.workout = workout
    end
  end

end
