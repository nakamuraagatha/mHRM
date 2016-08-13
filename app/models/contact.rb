class Contact < ApplicationRecord
  has_many :contact_links, foreign_key: :contact_to_id
  has_many :contact_types, through: :contact_links
end
