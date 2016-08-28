class Organization < ApplicationRecord
  has_many :users
  belongs_to :address

  def self.visible
    where(user_id: User.current.permitted_users)
  end

  def visible?
    User.current.permitted_users.include? user
  end
end
