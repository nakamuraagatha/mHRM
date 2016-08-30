class Email < ApplicationRecord
  belongs_to :email_type
  # belongs_to :extend_demography

  validates_presence_of :email_address, :email_type_id
  validates_uniqueness_of :email_address, scope: [:email_type_id, :extend_demography_id]
  validates_uniqueness_of :email_type_id, scope: [:extend_demography_id]
end
