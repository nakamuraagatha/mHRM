class Position < ApplicationRecord
  belongs_to :user
  belongs_to :department

  validates_presence_of :department_id, :user_id

  def visible?
    User.current.permitted_users.include? user
  end

  def self.safe_attributes
    [:user_id, :title, :position_description,
     :location_type_id, :special_requirement, :note,
     :date_start, :date_end, :files, :department_id, :salary]
  end

  mount_uploader :files, AttachmentUploader
end
