class CreateKeys < ActiveRecord::Migration[5.1]
  def change
    create_table :keys do |t|
      t.references :gate, foreign_key: true
      t.references :user, foreign_key: true
      t.string :name
      t.string :token
      t.datetime :expired_at

      t.timestamps
    end
  end
end
