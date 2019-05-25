class CreateVotes < ActiveRecord::Migration[5.2]
  def change
    create_table :votes do |t|
      t.references :candidate, foreign_key: { to_table: :users }
      t.references :voter, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
