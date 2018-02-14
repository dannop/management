class CreateProjects < ActiveRecord::Migration[5.1]
  def change
    create_table :projects do |t|
      t.string :name
      t.string :client
      t.text :description
      t.decimal :value
      t.date :start_date
      t.date :end_date
      t.references :team, foreign_key: true
      t.integer :current_sprint
      t.integer :total_sprint
      t.boolean :finalized

      t.timestamps
    end
  end
end
