class CreateProductItems < ActiveRecord::Migration[5.2]
  def change
    create_table :product_items do |t|
      t.integer :quantity
      t.references :product, foreign_key: true

      t.timestamps
    end
  end
end
