class TicketsUser < ApplicationRecord
  belongs_to :user
  belongs_to :ticket

  validates_uniqueness_of :ticket, scope: :user
end
