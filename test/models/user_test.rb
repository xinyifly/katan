require 'test_helper'

class UserTest < ActiveSupport::TestCase
  setup do
    @user = create(:user)
  end

  test 'can vote' do
    candidate = create(:candidate)
    assert_difference('Vote.count') do
      @user.vote(candidate)
    end
  end
end
