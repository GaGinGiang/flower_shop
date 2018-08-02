class CreateFlowers < ActiveRecord::Migration[5.2]
  def change
    create_table :flowers do |t|
      t.string :name
      t.references :category, foreign_key: true
      t.references :supplier, foreign_key: true
      t.float :price
      t.float :discount
      t.string :image
      t.string :description

      t.timestamps
    end
  end
end
