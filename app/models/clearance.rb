class Clearance < ApplicationRecord
  belongs_to :clearence_type
  belongs_to :user

  has_many :clearance_attachments, foreign_key: :owner_id
  accepts_nested_attributes_for :clearance_attachments, reject_if: :all_blank, allow_destroy: true


  def self.safe_attributes
    [:clearence_type_id, :user_id, :date_received, :note, :date_expired,
     clearance_attachments_attributes: [Attachment.safe_attributes]]
  end
end
