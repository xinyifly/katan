class Candidate < ApplicationRecord
  belongs_to :user
  belongs_to :poll, optional: true

  has_many :votes

  def score
    votes.count
  end
end
