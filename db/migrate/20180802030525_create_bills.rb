class CreateBills < ActiveRecord::Migration[5.2]
  def change
    create_table :bills do |t|
      t.references :oder
      t.references :user
      t.float :total_price

      t.timestamps
    end
  end
end
