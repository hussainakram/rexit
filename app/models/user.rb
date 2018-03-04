class User < ApplicationRecord
  enum role: [:user, :admin]
  has_many :customer_bags
  has_many :bags, through: :customer_bags
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  def is_admin?
    current_user.role == 1
  end
end
