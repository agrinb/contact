require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  test "should get upgrade" do
    get :upgrade
    assert_response :success
  end

end
