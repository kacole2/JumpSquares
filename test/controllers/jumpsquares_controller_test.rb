require 'test_helper'

class JumpsquaresControllerTest < ActionController::TestCase
  setup do
    @jumpsquare = jumpsquares(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:jumpsquares)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create jumpsquare" do
    assert_difference('Jumpsquare.count') do
      post :create, jumpsquare: { apptype: @jumpsquare.apptype, description: @jumpsquare.description, ipordns: @jumpsquare.ipordns, name: @jumpsquare.name, url: @jumpsquare.url }
    end

    assert_redirected_to jumpsquare_path(assigns(:jumpsquare))
  end

  test "should show jumpsquare" do
    get :show, id: @jumpsquare
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @jumpsquare
    assert_response :success
  end

  test "should update jumpsquare" do
    patch :update, id: @jumpsquare, jumpsquare: { apptype: @jumpsquare.apptype, description: @jumpsquare.description, ipordns: @jumpsquare.ipordns, name: @jumpsquare.name, url: @jumpsquare.url }
    assert_redirected_to jumpsquare_path(assigns(:jumpsquare))
  end

  test "should destroy jumpsquare" do
    assert_difference('Jumpsquare.count', -1) do
      delete :destroy, id: @jumpsquare
    end

    assert_redirected_to jumpsquares_path
  end
end
