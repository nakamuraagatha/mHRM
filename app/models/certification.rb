class Certification < ApplicationRecord
  belongs_to :certification_type
  belongs_to :user

  has_many :certification_attachments, foreign_key: :owner_id
  accepts_nested_attributes_for :certification_attachments, reject_if: :all_blank, allow_destroy: true

  def self.safe_attributes
    [:certification_type_id, :user_id, :date_received, :note, :date_expired,
     certification_attachments_attributes: [Attachment.safe_attributes]]
  end
end
