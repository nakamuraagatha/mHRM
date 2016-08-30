class Organization < ApplicationRecord
  has_many :users
  belongs_to :address
  belongs_to :user

  scope :visible, lambda {|action|  User.current.allowed_to?(action) ? where(nil) :  where(user_id: User.current.id) }


  def visible?
    User.current == user or User.current.allowed_to?(:edit_organizations) or User.current.allowed_to?(:manage_organizations)
  end
end
