class Ticket < ApplicationRecord
  belongs_to :user
  belongs_to :subcategory
  has_many :tickets_users
  has_many :providers, :through => :tickets_users, :source => :user
  has_many :skills_tickets
  has_many :skills, through: :skills_tickets
  accepts_nested_attributes_for :skills_tickets
end
