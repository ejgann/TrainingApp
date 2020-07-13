class TrainingSession < ApplicationRecord
  belongs_to :event
  belongs_to :workout
end
