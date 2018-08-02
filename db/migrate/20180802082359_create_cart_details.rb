class CreateCartDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :cart_details do |t|
      t.references :flower, foreign_key: true
      t.integer :quantity
      t.float :price
      t.float :discount

      t.timestamps
    end
  end
end
