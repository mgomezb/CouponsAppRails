class UserLocal < ActiveRecord::Base
	belongs_to :user
	belongs_to :local
end
