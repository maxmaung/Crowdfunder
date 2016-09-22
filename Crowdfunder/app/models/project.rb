class Project < ApplicationRecord
  has_many :pledges
  belongs_to :owner, class_name: 'User', inverse_of: :owned_projects
  has_many :users, through: :pledges

  def pledge_total
    self.pledges.sum(:amount)
  end
end
