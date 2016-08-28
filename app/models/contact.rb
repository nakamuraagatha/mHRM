class Contact < ApplicationRecord

  belongs_to :contact_type
  belongs_to :user
end
