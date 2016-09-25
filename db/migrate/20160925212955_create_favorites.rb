class CreateFavorites < ActiveRecord::Migration
  def change
    create_table :favorites do |t|
      t.integer :customer_id
      t.integer :vendor_id

      t.timestamps null: false
    end
  end
end
