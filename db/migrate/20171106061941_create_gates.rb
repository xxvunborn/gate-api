class CreateGates < ActiveRecord::Migration[5.1]
  def change
    create_table :gates do |t|
      t.string :name, null: false
      t.references :user, foreign_key: true
      t.string :location, null: false

      t.timestamps
    end
  end
end
