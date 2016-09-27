class AddProfilePicToVendors < ActiveRecord::Migration
  def self.up
    add_attachment :vendors, :profile_picture
  end

  def self.down
    remove_attachment :vendors, :profile_picture
  end
 
end

