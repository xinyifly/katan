require 'test_helper'

class PollsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @poll = create(:poll)
  end

  test 'should get index' do
    get polls_url
    assert_response :success
  end
end
