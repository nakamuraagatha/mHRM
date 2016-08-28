class CoreDemographic < ApplicationRecord
  belongs_to :user
  belongs_to :religion_type, foreign_key: :religion_id
  # belongs_to :ethnicity
  belongs_to :gender

  validates_presence_of :user
end
