class Item < ActiveRecord::Base
	validates :title, presence: true
	validates :price, presence: true
	validates :vendor_id, presence: true

	belongs_to :vendor
end
