class AddAttachmentImageToCoupons < ActiveRecord::Migration
  def self.up
    change_table :coupons do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :coupons, :image
  end
end
