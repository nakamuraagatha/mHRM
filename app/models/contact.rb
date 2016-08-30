class Contact < ApplicationRecord

  belongs_to :contact_type
  belongs_to :user

  scope :visible, lambda {|action|  User.current.allowed_to?(action) ? where(nil) :  where(user_id: User.current.id) }

end
