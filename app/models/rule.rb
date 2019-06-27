class Rule < ApplicationRecord
  enum key: { self_vote: 'self_vote' }, _prefix: true

  belongs_to :poll

  validates :key, uniqueness: { scope: :poll }

  def check(vote)
    send("check_#{key}", vote)
  end

  def check_self_vote(vote)
    # Values: '0' => disabled, '1' => enabled
    enabled = ActiveModel::Type::Boolean.new.cast(value)
    valid = enabled || vote.candidate.user != vote.voter
    vote.errors.add :candidate, "can't be yourself" unless valid
  end
end
