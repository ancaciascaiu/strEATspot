class Vendorscategory < ActiveRecord::Base
	validates :foodcategory_id, presence: true
	validates :vendor_id, presence: true

	belongs_to :vendor 
	belongs_to :foodcategory
end
