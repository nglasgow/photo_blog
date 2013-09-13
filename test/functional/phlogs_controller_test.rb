require 'test_helper'

class PhlogsControllerTest < ActionController::TestCase
  setup do
    @phlog = phlogs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:phlogs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create phlog" do
    assert_difference('Phlog.count') do
      post :create, phlog: { name: @phlog.name }
    end

    assert_redirected_to phlog_path(assigns(:phlog))
  end

  test "should show phlog" do
    get :show, id: @phlog
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @phlog
    assert_response :success
  end

  test "should update phlog" do
    put :update, id: @phlog, phlog: { name: @phlog.name }
    assert_redirected_to phlog_path(assigns(:phlog))
  end

  test "should destroy phlog" do
    assert_difference('Phlog.count', -1) do
      delete :destroy, id: @phlog
    end

    assert_redirected_to phlogs_path
  end
end
