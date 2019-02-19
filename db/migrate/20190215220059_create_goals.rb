class CreateGoals < ActiveRecord::Migration[5.2]
  def change
    create_table :goals do |t|
      t.integer :user_id
      t.datetime :end_date
      t.string :frequency
      t.text :goal
      t.string :subject
      t.boolean :active

      t.timestamps
    end
  end
end
