class ContactLink < ApplicationRecord
  belongs_to :contact_to, class_name: 'Contact'
  belongs_to :contact_from, class_name: 'Contact'
  belongs_to :contact_type

  validates_presence_of :contact_to_id, :contact_type_id, :contact_from_id
end
