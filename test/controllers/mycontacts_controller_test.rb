require 'test_helper'

class MycontactsControllerTest < ActionController::TestCase
  setup do
    @mycontact = mycontacts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:mycontacts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create mycontact" do
    assert_difference('Mycontact.count') do
      post :create, mycontact: { emailBusiness: @mycontact.emailBusiness, emailPersonal: @mycontact.emailPersonal, firstName: @mycontact.firstName, lastName: @mycontact.lastName }
    end

    assert_redirected_to mycontact_path(assigns(:mycontact))
  end

  test "should show mycontact" do
    get :show, id: @mycontact
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @mycontact
    assert_response :success
  end

  test "should update mycontact" do
    patch :update, id: @mycontact, mycontact: { emailBusiness: @mycontact.emailBusiness, emailPersonal: @mycontact.emailPersonal, firstName: @mycontact.firstName, lastName: @mycontact.lastName }
    assert_redirected_to mycontact_path(assigns(:mycontact))
  end

  test "should destroy mycontact" do
    assert_difference('Mycontact.count', -1) do
      delete :destroy, id: @mycontact
    end

    assert_redirected_to mycontacts_path
  end
end
