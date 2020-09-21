class Ticket < ApplicationRecord
  belongs_to :user
  belongs_to :subcategory
  has_many :users, as: :providers
  has_many :skills_tickets
  has_many :skills, through: :skills_tickets
end
