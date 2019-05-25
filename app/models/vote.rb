class Vote < ApplicationRecord
  belongs_to :candidate, class_name: 'User'
  belongs_to :voter, class_name: 'User'
end
