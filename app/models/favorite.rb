class Favorite < ActiveRecord::Base
	validates :customer_id, presence: true
	validates :vendor_id, presence: true
	
	belongs_to :customer
	belongs_to :vendor
end
