class CreateVendorscategories < ActiveRecord::Migration
  def change
    create_table :vendorscategories do |t|
      t.integer :vendor_id
      t.integer :foodcategory_id

      t.timestamps null: false
    end
  end
end
