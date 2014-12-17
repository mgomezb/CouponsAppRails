class ChangeUseInstructionsToCoupon < ActiveRecord::Migration
  def change
  	remove_column :coupons , :user_instructions, :string
	add_column :coupons, :use_instructions, :string
end
end
