class CreateRules < ActiveRecord::Migration[5.2]
  def change
    create_table :rules do |t|
      t.string :key
      t.string :value
      t.references :poll, foreign_key: true

      t.timestamps
    end
    add_index :rules, [:poll_id, :key], unique: true
  end
end
