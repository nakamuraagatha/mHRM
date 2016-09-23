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

  def to_pdf(pdf)
    pdf.text "<b>First name: </b> #{first_name}", :inline_format =>  true
    pdf.text "<b>Middle name: </b> #{middle_name}", :inline_format =>  true
    pdf.text "<b>Last name: </b> #{last_name}", :inline_format =>  true
    pdf.text "<b>Gender: </b> #{gender_type}", :inline_format =>  true
    pdf.text "<b>Birthday: </b> #{birth_date}", :inline_format =>  true
    pdf.text "<b>Religion: </b> #{religion_type}", :inline_format =>  true
    pdf.text "<b>Tile: </b> #{title}", :inline_format =>  true
    pdf.text "<b>Ethnicity: </b> #{ethnicity_type}", :inline_format =>  true
    pdf.text "<b>Citizenship: </b> #{citizenship_type}", :inline_format =>  true
    pdf.text "<b>Note: </b> #{ActionView::Base.full_sanitizer.sanitize(note)}", :inline_format =>  true
  end
end
