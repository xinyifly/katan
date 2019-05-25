require 'test_helper'

class UserTest < ActiveSupport::TestCase
  setup do
    @user = create(:user)
  end

  test 'has score' do
    assert_not_nil @user.score
  end

  test 'can vote' do
    candidate = create(:candidate)
    assert_difference('Vote.count') do
      @user.vote(candidate)
    end
  end

  test "can't vote self" do
    assert_no_difference('Vote.count') do
      @user.vote(@user)
    end
  end
end
