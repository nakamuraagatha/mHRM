class Education < ApplicationRecord
  belongs_to :user
  belongs_to :education_type
  belongs_to :certification_type
  belongs_to :clearence_type, :foreign_key => 'clearence'

  validates_presence_of :education_type_id, :clearence, :user_id

  def certification
    certification_type.try :name
  end

  def self.visible
    where(user_id: User.current.permitted_users)
  end

  def visible?
    User.current.permitted_users.include? user
  end

end
