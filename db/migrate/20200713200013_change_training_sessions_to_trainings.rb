class ChangeTrainingSessionsToTrainings < ActiveRecord::Migration[6.0]
  def change
    rename_table :training_sessions, :trainings
  end
end
