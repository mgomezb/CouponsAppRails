require 'test_helper'

class CouponsControllerTest < ActionController::TestCase
  setup do
    @coupon = coupons(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:coupons)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create coupon" do
    assert_difference('Coupon.count') do
      post :create, coupon: { access_level: @coupon.access_level, beacon_id: @coupon.beacon_id, code: @coupon.code, end_date: @coupon.end_date, image: @coupon.image, init_date: @coupon.init_date, legal: @coupon.legal, message: @coupon.message, proximity_trigger_range: @coupon.proximity_trigger_range, store_id: @coupon.store_id, title: @coupon.title }
    end

    assert_redirected_to coupon_path(assigns(:coupon))
  end

  test "should show coupon" do
    get :show, id: @coupon
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @coupon
    assert_response :success
  end

  test "should update coupon" do
    patch :update, id: @coupon, coupon: { access_level: @coupon.access_level, beacon_id: @coupon.beacon_id, code: @coupon.code, end_date: @coupon.end_date, image: @coupon.image, init_date: @coupon.init_date, legal: @coupon.legal, message: @coupon.message, proximity_trigger_range: @coupon.proximity_trigger_range, store_id: @coupon.store_id, title: @coupon.title }
    assert_redirected_to coupon_path(assigns(:coupon))
  end

  test "should destroy coupon" do
    assert_difference('Coupon.count', -1) do
      delete :destroy, id: @coupon
    end

    assert_redirected_to coupons_path
  end
end
