class Event < ApplicationRecord
  belongs_to :user
  has_many :training_sessions
  has_many :workouts, through: :training_sessions
end
