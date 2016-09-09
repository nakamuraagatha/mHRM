class OtherSkill < ApplicationRecord
  belongs_to :user

  has_many :skill_attachments, foreign_key: :owner_id
  accepts_nested_attributes_for :skill_attachments, reject_if: :all_blank, allow_destroy: true


  validates_presence_of :name

  def visible?
    User.current == user or User.current.allowed_to?(:edit_other_skills) or User.current.allowed_to?(:manage_other_skills)
  end

  def self.safe_attributes
    [:user_id, :name, :date_received, :date_expired, :note, skill_attachments_attributes: [Attachment.safe_attributes]]
  end
end
