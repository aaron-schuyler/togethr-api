class User < ApplicationRecord
  has_secure_password
  has_many :tickets
  has_many :tickets_users
  has_many :requests, :through => :tickets_users, :source => :ticket
  has_many :skills_users
  has_many :skills, through: :skills_users
end
