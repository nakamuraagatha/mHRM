class Education < ApplicationRecord
  belongs_to :user
  belongs_to :education_type
  belongs_to :certification_type
  belongs_to :clearence_type, :foreign_key => 'clearence'

  validates_presence_of :education_type_id, :clearence, :user_id

  def certification
    certification_type.try :name
  end

  scope :visible, lambda {|action|  User.current.allowed_to?(action) ? where(nil) :  where(user_id: User.current.id) }

  def visible?
    User.current == user or User.current.allowed_to?(:edit_educations) or User.current.allowed_to?(:manage_educations)
  end

end
