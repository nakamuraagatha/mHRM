class Phone < ApplicationRecord
  belongs_to :phone_type
  belongs_to :extend_demography

  validates_presence_of :phone_number, :phone_type_id
  validates_uniqueness_of :phone_number, scope: [:phone_type_id]
  validates_uniqueness_of :phone_type_id, scope: [:extend_demography_id]
  
end
