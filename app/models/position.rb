class Position < ApplicationRecord
  belongs_to :user
  belongs_to :department
  has_many :position_attachments, foreign_key: :owner_id
  accepts_nested_attributes_for :position_attachments, reject_if: :all_blank, allow_destroy: true

  validates_presence_of :department_id, :user_id

  def visible?
    User.current.permitted_users.include? user
  end

  def self.safe_attributes
    [:user_id, :title, :position_description,
     :location_type_id, :special_requirement, :note,
     :date_start, :date_end, :department_id, :salary,
     position_attachments_attributes: [Attachment.safe_attributes]]
  end

end
