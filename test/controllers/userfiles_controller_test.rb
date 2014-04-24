require 'test_helper'

class UserfilesControllerTest < ActionController::TestCase
  setup do
    @userfile = userfiles(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:userfiles)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create userfile" do
    assert_difference('Userfile.count') do
      post :create, userfile: { filename: @userfile.filename, meeting_id: @userfile.meeting_id }
    end

    assert_redirected_to userfile_path(assigns(:userfile))
  end

  test "should show userfile" do
    get :show, id: @userfile
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @userfile
    assert_response :success
  end

  test "should update userfile" do
    patch :update, id: @userfile, userfile: { filename: @userfile.filename, meeting_id: @userfile.meeting_id }
    assert_redirected_to userfile_path(assigns(:userfile))
  end

  test "should destroy userfile" do
    assert_difference('Userfile.count', -1) do
      delete :destroy, id: @userfile
    end

    assert_redirected_to userfiles_path
  end
end
