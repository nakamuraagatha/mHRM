class Identification < ApplicationRecord
  validates_presence_of :identification_number, :identification_type_id
  validates_uniqueness_of :identification_type_id, scope: [:extend_demography_id]

  def self.safe_attributes
    [:id, :identification_number, :status, :date_expired, :issued_by, :note, :identification_type_id, :_destroy]
  end

end
