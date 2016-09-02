class Contact < ApplicationRecord
  belongs_to :contact_type
  belongs_to :user

  def self.safe_attributes
    [:emergency_contact, :first_name, :middle_name, :last_name,
     :note, :contact_type_id, :user_id]
  end
end
