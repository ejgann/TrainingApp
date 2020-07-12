class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.string :title
      t.string :category
      t.string :description
      t.integer :length
      t.belongs_to :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
