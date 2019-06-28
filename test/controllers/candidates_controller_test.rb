require 'test_helper'

class CandidatesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @poll = create(:poll)
    @candidate = create(:candidate, poll: @poll)
  end

  test 'should get index' do
    get poll_candidates_url(@poll)
    assert_response :success
  end

  test 'should see email' do
    get poll_candidates_url(@poll)
    assert_select 'td', @candidate.user.email
  end

  test 'should see score' do
    get poll_candidates_url(@poll)
    assert_select 'td', @candidate.score.to_s
  end

  class LoggedUserTest < ActionDispatch::IntegrationTest
    setup do
      @poll = create(:poll)
      @candidate = create(:candidate, poll: @poll)
      sign_in @user = create(:user)
    end

    test 'should see vote' do
      get poll_candidates_url(@poll)
      assert_select 'a', 'Vote'
    end
  end
end
