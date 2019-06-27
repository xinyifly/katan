class AddUniqToCandidates < ActiveRecord::Migration[5.2]
  def change
    add_index :candidates, [:user_id, :poll_id], unique: true
  end
end
