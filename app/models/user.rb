class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :category_budgets
  has_many :budgets, through: :category_budgets
  has_many :expenses, through: :budgets
  has_one :profile
end
