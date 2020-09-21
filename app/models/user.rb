class User < ApplicationRecord
  has_many :tickets
  has_many :tickets, as: :requests
  has_many :skills_users
  has_many :skills, through: :skills_users
end
