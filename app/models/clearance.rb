class Clearance < ApplicationRecord
  belongs_to :clearence_type
  belongs_to :user

  def self.safe_attributes
    [:clearence_type_id, :user_id, :date_received, :note, :date_expired]
  end
end
