class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :name, default: ""
      t.string :email
      t.text :address, default: ""
      t.string :phone, default: ""
      t.string :role
      t.timestamps
    end
  end
end
