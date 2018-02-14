class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.boolean :admin
      t.boolean :director
      t.boolean :pmo
      t.boolean :developer
      t.boolean :advisor

      t.timestamps
    end
  end
end
