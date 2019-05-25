require 'test_helper'

class CandidatesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @candidate = create(:candidate)
  end

  test 'should get index' do
    get candidates_url
    assert_response :success
  end

  test 'should see email' do
    get candidates_url
    assert_select 'td', @candidate.email
  end

  test 'should see score' do
    get candidates_url
    assert_select 'td', @candidate.score.to_s
  end

  class LoggedUserTest < ActionDispatch::IntegrationTest
    setup do
      @candidate = create(:candidate)
      sign_in @user = create(:user)
    end

    test 'should see vote' do
      get candidates_url
      assert_select 'a', 'Vote'
    end
  end
end
