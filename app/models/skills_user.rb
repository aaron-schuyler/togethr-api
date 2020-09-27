class SkillsUser < ApplicationRecord
  belongs_to :user
  belongs_to :skill

  validates_uniqueness_of :skill, scope: :user
end
