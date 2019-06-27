require 'test_helper'

class PollsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @poll = create(:poll)
  end

  test 'should get index' do
    get polls_url
    assert_response :success
  end

  test 'should see name' do
    get polls_url
    assert_select 'td', @poll.name
  end

  test 'should see candidates' do
    get polls_url
    assert_select 'a', 'Candidates'
  end
end
