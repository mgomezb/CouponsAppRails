class DeleteImageFromCoupons < ActiveRecord::Migration
  def change
  	remove_column :coupons , :image, :string
  end
end
