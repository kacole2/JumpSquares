require 'test_helper'

class StaticPagesControllerTest < ActionController::TestCase
  test "should get help" do
    get :help
    assert_response :success
  end

  test "should get about" do
    get :about
    assert_response :success
  end

  test "should get contact" do
    get :contact
    assert_response :success
  end

  test "should get settings" do
    get :settings
    assert_response :success
  end

  test "should get home" do
    get :home
    assert_response :success
  end

end
