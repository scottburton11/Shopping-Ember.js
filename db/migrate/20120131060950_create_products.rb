class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.string :description
      t.string :image_url
      t.integer :price_cents
      t.integer :designer_id

      t.timestamps
    end
  end
end
