class Address < ApplicationRecord
  # belongs_to :address_type
  belongs_to :extend_demography

  validates_presence_of :address, :address_type_id
  validates_uniqueness_of :address, scope: [:address_type_id]
  validates_uniqueness_of :address_type_id, scope: [:extend_demography_id]
end
