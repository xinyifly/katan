class Poll < ApplicationRecord
  has_many :candidates

  validates :name, uniqueness: true
end
