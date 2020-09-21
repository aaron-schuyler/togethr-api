class Skill < ApplicationRecord
  belongs_to :subcategory
  has_many :user_skills
  has_many :users, through: :skills_user
end
