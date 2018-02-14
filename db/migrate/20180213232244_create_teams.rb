class CreateTeams < ActiveRecord::Migration[5.1]
  def change
    create_table :teams do |t|
      t.string :name
      t.integer :number_of_members
      t.references :user, foreign_key: true
      t.integer :limit_of_projects

      t.timestamps
    end
  end
end
