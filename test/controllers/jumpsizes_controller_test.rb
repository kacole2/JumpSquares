require 'test_helper'

class JumpsizesControllerTest < ActionController::TestCase
  setup do
    @jumpsize = jumpsizes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:jumpsizes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create jumpsize" do
    assert_difference('Jumpsize.count') do
      post :create, jumpsize: { length1: @jumpsize.length1, length2: @jumpsize.length2, size: @jumpsize.size }
    end

    assert_redirected_to jumpsize_path(assigns(:jumpsize))
  end

  test "should show jumpsize" do
    get :show, id: @jumpsize
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @jumpsize
    assert_response :success
  end

  test "should update jumpsize" do
    patch :update, id: @jumpsize, jumpsize: { length1: @jumpsize.length1, length2: @jumpsize.length2, size: @jumpsize.size }
    assert_redirected_to jumpsize_path(assigns(:jumpsize))
  end

  test "should destroy jumpsize" do
    assert_difference('Jumpsize.count', -1) do
      delete :destroy, id: @jumpsize
    end

    assert_redirected_to jumpsizes_path
  end
end
