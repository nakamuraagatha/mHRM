class Survey::Survey < ActiveRecord::Base

  self.table_name = "survey_surveys"

  acceptable_attributes :name, :description,
                        :finished,
                        :active,
                        :attempts_number,
                        :survey_type_id,
                        :questions_attributes => Survey::Question::AccessibleAttributes

  # relations
  has_many :attempts,  :dependent => :destroy
  has_many :questions, :dependent => :destroy
  belongs_to :survey_type, optional: true
  has_many :survey_users
  has_many :survey_notes, foreign_key: :owner_id

  belongs_to :case, optional: true, foreign_key: :related_to_id


  accepts_nested_attributes_for :questions,
                                :reject_if => ->(q) { q[:text].blank? },
                                :allow_destroy => true

  # scopes
  scope :active,   -> { where(:active => true) }
  scope :inactive, -> { where(:active => false) }
  scope :not_related, -> {where(related_to_id: nil)}


  # validations
  validates :attempts_number, :numericality => { :only_integer => true, :greater_than => -1 }
  validates :description, :name, :presence => true, :allow_blank => false
  validate  :check_active_requirements


  def to_s
    name
  end

  def survey_type
    if survey_type_id
      super
    else
      SurveyType.default
    end
  end
  # returns all the correct options for current surveys
  def correct_options
    return self.questions.map(&:correct_options).flatten
  end

  # returns all the incorrect options for current surveys
  def incorrect_options
    return self.questions.map(&:incorrect_options).flatten
  end

  def available_for_participant?(participant)
    current_number_of_attempts = self.attempts.for_participant(participant).size
    upper_bound = self.attempts_number
    return !((current_number_of_attempts >= upper_bound) && (upper_bound != 0))
  end

  def avaliable_for_participant?(participant)
    warn "[DEPRECATION] avaliable_for_participant? is deprecated. Please use available_for_participant? instead"
    available_for_participant?(participant)
  end

  def to_pdf(pdf)
    pdf.font_size(25){  pdf.text "Survey ##{id}", :style => :bold}
    pdf.text "<b>name: </b> #{name}", :inline_format =>  true
    pdf.text "<b>Description: </b> #{ActionView::Base.full_sanitizer.sanitize(description)}", :inline_format =>  true
    self.questions.each_with_index do |question, index|
      pdf.text "<b>Q#{index+1}: </b>", :inline_format =>  true
      pdf.text "<b>#{question.text}: </b>", :inline_format =>  true
      question.options.each do |option|
        pdf.text "-#{option.text}: </b>", :inline_format =>  true
      end
    end
  end

  private

  # a surveys only can be activated if has one or more questions
  def check_active_requirements
    errors.add(:active, "Survey without questions cannot be activated") if self.active && self.questions.empty?
  end
end
