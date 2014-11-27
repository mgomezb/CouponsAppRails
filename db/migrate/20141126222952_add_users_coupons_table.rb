class AddUsersCouponsTable < ActiveRecord::Migration
  def change
  		create_table :users_coupons do |t|
  			t.integer :user_id
  			t.integer :coupon_id
  		end
  end
end
