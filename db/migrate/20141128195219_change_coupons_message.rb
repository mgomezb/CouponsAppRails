class ChangeCouponsMessage < ActiveRecord::Migration
  def change
  	change_column :coupons, :message, :text
  	change_column :coupons, :legal, :text
  end
end
