class Contact < ApplicationRecord

  belongs_to :contact_type
  belongs_to :user

  def self.visible
    where(user_id: User.current.permitted_users)
  end

  def visible?
    User.current.permitted_users.include? user
  end

end
