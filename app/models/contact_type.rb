class ContactType < ApplicationRecord
  has_many :contact_links
  has_many :contacts, through: :contact_links
end
