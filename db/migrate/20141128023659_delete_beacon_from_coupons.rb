class DeleteBeaconFromCoupons < ActiveRecord::Migration
  def change
  	remove_column :coupons , :beacon_id, :integer
  end
end
