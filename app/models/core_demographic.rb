class CoreDemographic < ApplicationRecord
  belongs_to :user
  belongs_to :religion
  belongs_to :ethnicity
  belongs_to :gender
end
