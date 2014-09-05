require 'test_helper'

class NotificationsControllerTest < ActionController::TestCase
  setup do
    @notification = notifications(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:notifications)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create notification" do
    assert_difference('Notification.count') do
      post :create, notification: { beacon_id: @notification.beacon_id, end_date: @notification.end_date, init_date: @notification.init_date, message: @notification.message, proximity_trigger_range: @notification.proximity_trigger_range, store_id: @notification.store_id, title: @notification.title }
    end

    assert_redirected_to notification_path(assigns(:notification))
  end

  test "should show notification" do
    get :show, id: @notification
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @notification
    assert_response :success
  end

  test "should update notification" do
    patch :update, id: @notification, notification: { beacon_id: @notification.beacon_id, end_date: @notification.end_date, init_date: @notification.init_date, message: @notification.message, proximity_trigger_range: @notification.proximity_trigger_range, store_id: @notification.store_id, title: @notification.title }
    assert_redirected_to notification_path(assigns(:notification))
  end

  test "should destroy notification" do
    assert_difference('Notification.count', -1) do
      delete :destroy, id: @notification
    end

    assert_redirected_to notifications_path
  end
end