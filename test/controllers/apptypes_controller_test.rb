require 'test_helper'

class ApptypesControllerTest < ActionController::TestCase
  setup do
    @apptype = apptypes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:apptypes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create apptype" do
    assert_difference('Apptype.count') do
      post :create, apptype: { image: @apptype.image, name: @apptype.name }
    end

    assert_redirected_to apptype_path(assigns(:apptype))
  end

  test "should show apptype" do
    get :show, id: @apptype
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @apptype
    assert_response :success
  end

  test "should update apptype" do
    patch :update, id: @apptype, apptype: { image: @apptype.image, name: @apptype.name }
    assert_redirected_to apptype_path(assigns(:apptype))
  end

  test "should destroy apptype" do
    assert_difference('Apptype.count', -1) do
      delete :destroy, id: @apptype
    end

    assert_redirected_to apptypes_path
  end
end
