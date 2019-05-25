require 'test_helper'

class VotesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @vote = create(:vote)
  end

  test 'should get new' do
    get new_vote_url
    assert_response :success
  end

  test 'should create vote' do
    candidate = create(:candidate)
    sign_in create(:voter)
    assert_difference('Vote.count') do
      post votes_url, params: { vote: { candidate_id: candidate.id } }
    end

    assert_redirected_to vote_url(Vote.last)
  end

  test 'should show vote' do
    get vote_url(@vote)
    assert_response :success
  end
end
