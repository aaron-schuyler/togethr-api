class Category < ApplicationRecord
  has_many :subcategories
  has_many :skills, through: :subcategories
  has_many :users, through: :skills
end
