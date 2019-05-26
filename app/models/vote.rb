class Vote < ApplicationRecord
  belongs_to :candidate, class_name: 'User'
  belongs_to :voter, class_name: 'User'

  validate :candidate_cannot_be_yourself

  def candidate_cannot_be_yourself
    errors.add :candidate, "can't be yourself" if candidate == voter
  end
end
