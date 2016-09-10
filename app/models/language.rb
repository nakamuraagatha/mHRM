class Language < ApplicationRecord
  belongs_to :user
  belongs_to :language_type
  belongs_to :proficiency_type, foreign_key: :proficiency_id

  has_many :language_attachments, foreign_key: :owner_id
  accepts_nested_attributes_for :language_attachments, reject_if: :all_blank, allow_destroy: true

  def visible?
    User.current.permitted_users.include? user
  end

  def self.safe_attributes
    [:user_id, :note, :language_type_id, :proficiency_id,
     language_attachments_attributes: [Attachment.safe_attributes]]
  end

end
