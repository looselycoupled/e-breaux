require 'test_helper'

class TargetsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get add" do
    get :add
    assert_response :success
  end

  test "should get subscribe" do
    get :subscribe
    assert_response :success
  end

  test "should get unsubscribe" do
    get :unsubscribe
    assert_response :success
  end

  test "should get delete" do
    get :delete
    assert_response :success
  end

end
