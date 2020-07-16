# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# users
emily = User.new(username: "Emily", email: "emily@email.com", password: "asdf")
irena = User.new(username: "Irena", email: "irena@email.com", password: "asdf")
carrie = User.new(username: "Carrie", email: "carrie@email.com", password: "asdf")

# events
mudder = Event.new(title: "Tough Mudder", category: "Obstacle Course", description: "A challenging obstacle course race", length: 5, user_id: 1)
turkey_trot = Event.new(title: "Turkey Trot", category: "fun run", description: "A fun, Thanksgiving Day run", length: 5, user_id: 2)


# workouts
murph = Workout.new(name: "Murph", category: "circuit", duration: 60, intensity: 5, user_id: 1)
short_run = Workout.new(name: "Short Run", category: "run", duration: 30, intensity: 3, user_id: 2)
long_run = Workout.new(name: "Long Run", category: "run", duration: 45, intensity: 4, user_id: 3)

# trainings
ts1 = Training.new(date: 7/11/20, notes: "Difficult to sustain", event_id: 1, workout_id: 1)
ts2 = Training.new(date: 7/12/20, notes: "Did well", event_id: 2, workout_id: 2)