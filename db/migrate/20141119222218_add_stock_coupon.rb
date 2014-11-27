class AddStockCoupon < ActiveRecord::Migration
  def change
  	add_column :coupons, :stock, :integer
  end
end
