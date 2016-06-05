require 'test_helper'

class TimersControllerTest < ActionController::TestCase
  setup do
    @timer = timers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:timers)
  end

  test "should create timer" do
    assert_difference('Timer.count') do
      post :create, timer: { token: @timer.token, user_id: @timer.user_id }
    end

    assert_response 201
  end

  test "should show timer" do
    get :show, id: @timer
    assert_response :success
  end

  test "should update timer" do
    put :update, id: @timer, timer: { token: @timer.token, user_id: @timer.user_id }
    assert_response 204
  end

  test "should destroy timer" do
    assert_difference('Timer.count', -1) do
      delete :destroy, id: @timer
    end

    assert_response 204
  end
end
