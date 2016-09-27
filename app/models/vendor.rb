class Vendor < ActiveRecord::Base
  has_many :favorites
  has_many :items
  has_many :vendorscategories
  has_many :foodcategories, through: :vendorscategories

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  #hello i am for paperclip
	has_attached_file :avatar, :styles => { :medium => "300x300>", :large => "400x400#" }, :default_url => "./images/missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
end
