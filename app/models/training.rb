class Training < ApplicationRecord
  belongs_to :event
  belongs_to :workout
  accepts_nested_attributes_for :workout
  # this creates a custom writer method called "workout_attributes=(attributes)"", which is referenced in training_params
end
