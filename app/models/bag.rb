class Bag < ApplicationRecord
  has_many :customer_bags
  has_many :users, through: :customer_bags


  def self.calculate_price
    if self.bag_type.present?
      if bag_type == "PET" || bag_type == "TIN"
        self.price = self.weigth * 15
      elsif bag_type == "Mixed/Dry"
        self.price = self.weigth * 10
      end
    end
  end
end
