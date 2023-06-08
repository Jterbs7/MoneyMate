class Budget < ApplicationRecord
  belongs_to :category_budget
  has_many :expenses
end
