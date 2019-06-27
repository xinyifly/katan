require 'test_helper'

class RuleTest < ActiveSupport::TestCase
  test 'check self vote' do
    poll = create(:poll)

    key = Rule.keys[:self_vote]
    value = '0' # disabled
    rule = create(:rule, key: key, value: value, poll: poll)

    candidate = create(:candidate, poll: poll)

    # Disabled self vote
    vote = build(:vote, candidate: candidate, voter: candidate.user)
    rule.check_self_vote(vote)
    assert_not_empty vote.errors

    # Enabled self vote
    rule.value = '1'
    rule.save!
    vote = build(:vote, candidate: candidate, voter: candidate.user)
    rule.check_self_vote(vote)
    assert_empty vote.errors
  end
end
