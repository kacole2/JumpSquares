require 'test_helper'

class NmapfilesControllerTest < ActionController::TestCase
  setup do
    @nmapfile = nmapfiles(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:nmapfiles)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create nmapfile" do
    assert_difference('Nmapfile.count') do
      post :create, nmapfile: { nmapfilematches: @nmapfile.nmapfilematches, nmapfilename: @nmapfile.nmapfilename, nmapfilerecords: @nmapfile.nmapfilerecords }
    end

    assert_redirected_to nmapfile_path(assigns(:nmapfile))
  end

  test "should show nmapfile" do
    get :show, id: @nmapfile
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @nmapfile
    assert_response :success
  end

  test "should update nmapfile" do
    patch :update, id: @nmapfile, nmapfile: { nmapfilematches: @nmapfile.nmapfilematches, nmapfilename: @nmapfile.nmapfilename, nmapfilerecords: @nmapfile.nmapfilerecords }
    assert_redirected_to nmapfile_path(assigns(:nmapfile))
  end

  test "should destroy nmapfile" do
    assert_difference('Nmapfile.count', -1) do
      delete :destroy, id: @nmapfile
    end

    assert_redirected_to nmapfiles_path
  end
end
