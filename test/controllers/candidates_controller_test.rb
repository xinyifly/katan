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
end
