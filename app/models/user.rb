class User < ApplicationRecord
    has_many :created_workouts, foreign_key: "user_id", class_name: "Workout"
    # this is the relationship where the user creates the workout him/herself; no repeats
    has_many :events
    has_many :completed_workouts, through: :events, source: :workouts
    # this refers to the relationship where the user did this workout in preparation for a specific event; could have repeats with this one
    has_secure_password
end
