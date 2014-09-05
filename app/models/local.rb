class Local < ActiveRecord::Base
	
	has_many :users, through: :user_locals
	has_many :user_locals
	has_many :beacons
	has_many :stores
	belongs_to :user

	geocoded_by :address
	after_validation :geocode
	validates :name, presence: true
end