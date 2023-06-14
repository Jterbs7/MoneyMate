class CategoryBudget < ApplicationRecord
  has_many :budgets
  has_many :expenses, through: :budgets
  belongs_to :user
end
