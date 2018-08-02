class CreateFlowers < ActiveRecord::Migration[5.2]
  def change
    create_table :flowers do |t|
      t.string :name
      t.references :category
      t.references :supplier
      t.float :price
      t.float :discount
      t.string :image
      t.string :description

      t.timestamps
    end
  end
end
