class Budget < ApplicationRecord
  belongs_to :category_budget
  # belongs_to :category, class_name: 'CategoryBudget', foreign_key: 'category_budget_id'

  has_many :expenses
end
