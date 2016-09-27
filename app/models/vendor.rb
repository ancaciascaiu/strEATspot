class Vendor < ActiveRecord::Base
  has_many :favorites
  has_many :items
  has_many :vendorscategories
  has_many :foodcategories, through: :vendorscategories

  has_attached_file :profile_picture
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

end
