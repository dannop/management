class CreateTeamsProjects < ActiveRecord::Migration[5.1]
  def change
    create_table :teams_projects do |t|
      t.references :team, foreign_key: true
      t.references :project, foreign_key: true

      t.timestamps
    end
  end
end
