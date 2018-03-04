class CustomerBag < ApplicationRecord
  belongs_to :user
  belongs_to :bag
end
