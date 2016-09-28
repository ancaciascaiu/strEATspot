class AddAvatarsToVendors < ActiveRecord::Migration
    def self.up
    change_table :vendors do |t|
      t.attachment :avatar
    end
  end

  def self.down
    drop_attached_file :vendors, :avatar
  end
end

