require 'test_helper'

class PagesControllerTest < ActionController::TestCase
  test "should get groups" do
    get :groups
    assert_response :success
  end

end
