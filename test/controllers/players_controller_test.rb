require "test_helper"

class PlayersControllerTest < ActionDispatch::IntegrationTest
  test "should get update" do
    get players_update_url
    assert_response :success
  end
end
