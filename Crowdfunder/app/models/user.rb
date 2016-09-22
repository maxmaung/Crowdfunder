class User < ApplicationRecord
  has_many :owned_projects, class_name: 'Project', inverse_of: :owner
  has_many :projects, through: :pledges
  has_many :pledges

  has_secure_password

  validates :email, uniqueness: true
end
