class Organization < ApplicationRecord
  has_many :users
  belongs_to :address
end
