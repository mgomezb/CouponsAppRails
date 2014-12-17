class AddUserInstructionsToCoupon < ActiveRecord::Migration
  def change
  	add_column :coupons, :user_instructions, :string
  end
end
