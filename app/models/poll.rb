class Poll < ApplicationRecord
  has_many :candidates
  has_many :rules

  validates :name, uniqueness: true
end
