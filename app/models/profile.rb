class Profile < ApplicationRecord
  belongs_to :user
  has_many :category_budgets
  has_many :profile_badges
  has_many :badges, through: :profile_badges
end
