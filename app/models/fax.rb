class Fax < ApplicationRecord
  belongs_to :fax_type
  belongs_to :extend_demography

  validates_presence_of :fax_number, :fax_type_id
  validates_uniqueness_of :fax_number, scope: [:fax_type_id, :extend_demography_id]
  validates_uniqueness_of :fax_type_id, scope: [:extend_demography_id]
end
