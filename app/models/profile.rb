class Profile < ApplicationRecord
  belongs_to :user
  has_many :category_budgets
end
