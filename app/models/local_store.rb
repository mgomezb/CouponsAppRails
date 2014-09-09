class LocalStore < ActiveRecord::Base
	belongs_to :local
	belongs_to :store
end
