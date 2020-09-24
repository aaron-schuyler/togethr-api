class SkillsTicket < ApplicationRecord
  belongs_to :skill
  belongs_to :ticket
  accepts_nested_attributes_for :skill
end
