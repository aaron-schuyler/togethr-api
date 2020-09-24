class Skill < ApplicationRecord
  belongs_to :subcategory
  has_many :skills_user
  has_many :users, through: :skills_user
end
