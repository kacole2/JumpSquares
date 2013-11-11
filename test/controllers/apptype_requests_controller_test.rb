require 'test_helper'

class ApptypeRequestsControllerTest < ActionController::TestCase
  setup do
    @apptype_request = apptype_requests(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:apptype_requests)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create apptype_request" do
    assert_difference('ApptypeRequest.count') do
      post :create, apptype_request: {  }
    end

    assert_redirected_to apptype_request_path(assigns(:apptype_request))
  end

  test "should show apptype_request" do
    get :show, id: @apptype_request
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @apptype_request
    assert_response :success
  end

  test "should update apptype_request" do
    patch :update, id: @apptype_request, apptype_request: {  }
    assert_redirected_to apptype_request_path(assigns(:apptype_request))
  end

  test "should destroy apptype_request" do
    assert_difference('ApptypeRequest.count', -1) do
      delete :destroy, id: @apptype_request
    end

    assert_redirected_to apptype_requests_path
  end
end
