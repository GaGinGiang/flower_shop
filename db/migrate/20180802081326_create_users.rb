class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.integer :sex, default: 0
      t.string :address
      t.string :username
      t.string :email

      t.timestamps
    end
  end
end
