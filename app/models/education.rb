class Education < ApplicationRecord
  belongs_to :user
  belongs_to :education_type
  belongs_to :clearence_type, :foreign_key => 'clearence'

  validates_presence_of :education_type_id, :clearence, :user_id

  class Certification
    ARRAY = ['CompTIA A+', 'CompTIA Network +', 'CompTIA Security +']
  end
end
