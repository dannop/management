class CreateTasks < ActiveRecord::Migration[5.1]
  def change
    create_table :tasks do |t|
      t.string :name
      t.text :description
      t.references :project, foreign_key: true
      t.references :directory, foreign_key: true
      t.references :goal, foreign_key: true

      t.timestamps
    end
  end
end
