class Category < ApplicationRecord
  has_many :subcategories
  has_many :skills, through: :subcategories
end
