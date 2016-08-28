class JobDetail < ApplicationRecord
  belongs_to :user
  belongs_to :department
  belongs_to :role

  validates_presence_of :user ,:department, :role
end
