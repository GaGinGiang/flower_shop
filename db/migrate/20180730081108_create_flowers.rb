class CreateFlowers < ActiveRecord::Migration[5.2]
  def change
    create_table :flowers do |t|
      t.string :name
      t.string :description
      t.string :image
      t.float :price
      t.float :discount

      t.timestamps
    end
  end
end
