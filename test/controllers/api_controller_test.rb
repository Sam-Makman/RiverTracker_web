require 'test_helper'

class ApiControllerTest < ActionController::TestCase
  test "should get Login" do
    get :login
    assert_response :success
  end

  test "should get Signup" do
    get :signup
    assert_response :success
  end

  test "should get Rivers" do
    get :rivers
    assert_response :success
  end

  test "should get River" do
    get :river
    assert_response :success
  end

  test "should get Favorites" do
    get :favorites
    assert_response :success
  end

end
