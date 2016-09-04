class Education < ApplicationRecord
  belongs_to :user
  belongs_to :education_type

  validates_presence_of :education_type_id, :user_id

  def certification
    certification_type.try :name
  end

  def visible?
    User.current == user or User.current.allowed_to?(:edit_educations) or User.current.allowed_to?(:manage_educations)
  end

  def self.safe_attributes
    [:user_id, :education_type_id, :date_recieved, :date_expired, :note]
  end

end
