require 'test_helper'

class CandidateTest < ActiveSupport::TestCase
  setup do
    @candidate = create(:candidate)
  end

  test 'has score' do
    assert_not_nil @candidate.score
  end
end
