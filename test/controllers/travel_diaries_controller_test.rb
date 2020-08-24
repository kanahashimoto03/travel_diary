require 'test_helper'

class TravelDiariesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get travel_diaries_index_url
    assert_response :success
  end

end
