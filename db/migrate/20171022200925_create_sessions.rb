class CreateSessions < ActiveRecord::Migration[5.1]
  def change
    create_table :sessions do |t|
      t.references :user, foreign_key: true
      t.string :token, null: false
      t.datetime :expired_at

      t.timestamps
    end
  end
end
