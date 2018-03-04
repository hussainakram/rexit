class CreateBags < ActiveRecord::Migration[5.0]
  def change
    create_table :bags do |t|
      t.string :type, default: ""
      t.string :weight, default: ""
      t.integer :price, default: 0

      t.timestamps
    end
  end
end
