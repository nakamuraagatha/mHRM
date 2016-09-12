class CoreDemographic < ApplicationRecord
  belongs_to :user
  belongs_to :religion_type, foreign_key: :religion_id, optional: true
  belongs_to :gender_type, foreign_key: :gender_id, optional: true
  belongs_to :citizenship_type, optional: true
  belongs_to :ethnicity_type, foreign_key: :ethnicity_id, optional: true

  # validates_presence_of :user

  def religion_type
    if religion_id
      super
    else
      ReligionType.default
    end
  end
  def gender_type
    if gender_id
      super
    else
      GenderType.default
    end
  end
  def citizenship_type
    if citizenship_type_id
      super
    else
      CitizenshipType.default
    end
  end
  def ethnicity_type
    if ethnicity_id
      super
    else
      EthnicityType.default
    end
  end
  def self.safe_attributes
    [:user_id, :first_name, :last_name, :middle_name, :gender_id,
     :birth_date, :religion_id, :title, :note, :ethnicity_id, :citizenship_type_id]
  end

  def gender
    gender_type
  end
end
