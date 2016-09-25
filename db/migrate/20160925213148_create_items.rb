class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :title
      t.string :description
      t.float :price
      t.integer :vendor_id

      t.timestamps null: false
    end
  end
end
