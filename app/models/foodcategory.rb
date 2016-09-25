class Foodcategory < ActiveRecord::Base
	validates :name, presence: true, uniqueness: true
	
	has_many :vendorscategories
	has_many :vendors, through: :vendorscategories
end
