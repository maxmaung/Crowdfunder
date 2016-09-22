class Project < ApplicationRecord
  has_many :pledges
  belongs_to :owner, class_name: 'User', inverse_of: :owned_projects
  has_many :users, through: :pledges
end
