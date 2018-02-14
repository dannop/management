class CreateGoals < ActiveRecord::Migration[5.1]
  def change
    create_table :goals do |t|
      t.string :name
      t.date :begin_date
      t.date :end_date
      t.references :directory, foreign_key: true

      t.timestamps
    end
  end
end
