class AddBeaconsCouponsTable < ActiveRecord::Migration
  def change
  	create_table :beacons_coupons do |t|
  			t.integer :beacon_id
  			t.integer :coupon_id
  		end
  end
end
