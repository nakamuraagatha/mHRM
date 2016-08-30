class Position < ApplicationRecord
  belongs_to :user

  scope :visible, lambda {|action|  User.current.allowed_to?(action) ? where(nil) :  where(user_id: User.current.id) }

  def visible?
    User.current.permitted_users.include? user
  end

end
