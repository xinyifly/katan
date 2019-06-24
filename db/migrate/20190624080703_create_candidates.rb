class CreateCandidates < ActiveRecord::Migration[5.2]
  def change
    create_table :candidates do |t|
      t.references :user, foreign_key: true
      t.references :poll, foreign_key: true

      t.timestamps
    end

    revert do
      add_foreign_key :votes, :users, column: :candidate_id
    end

    reversible do |dir|
      dir.up do
        execute <<~SQL
          INSERT INTO candidates (user_id, created_at, updated_at)
            SELECT DISTINCT candidate_id, min(created_at) OVER (PARTITION BY candidate_id), min(created_at) OVER (PARTITION BY candidate_id)
              FROM votes;
          UPDATE votes SET candidate_id = (SELECT id FROM candidates WHERE user_id = candidate_id);
        SQL
      end

      dir.down do
        execute <<~SQL
          UPDATE votes SET candidate_id = (SELECT user_id FROM candidates WHERE id = candidate_id);
        SQL
      end
    end

    add_foreign_key :votes, :candidates
  end
end
