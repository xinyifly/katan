class Vote < ApplicationRecord
  belongs_to :candidate
  belongs_to :voter, class_name: 'User'

  validate :check_rules, on: :create

  def check_rules
    candidate.poll.rules.each { |rule| rule.check(self) }
  end
end
