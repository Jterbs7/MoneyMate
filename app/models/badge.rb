class Badge < ApplicationRecord
  has_many :profile_badges
  has_many :profiles, through: :profile_badges
end
