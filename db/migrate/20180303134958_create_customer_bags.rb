class CreateCustomerBags < ActiveRecord::Migration[5.0]
  def change
    create_table :customer_bags do |t|
      t.references :user, foreign_key: true
      t.references :bag, foreign_key: true

      t.timestamps
    end
  end
end
