class ChangeColumnOfBag < ActiveRecord::Migration[5.0]
  def change
    rename_column :bags, :type, :bag_type
  end
end
