class AddCategoryToCoupon < ActiveRecord::Migration
  def change
  	add_column :coupons, :category, :integer
  end
end
