class SurveyType < Enumeration
  has_many :surveys

  OptionName = :enumeration_survey_type

  def option_name
    OptionName
  end

  def objects
    Survey::Survey.where(:survey_type_id => self.id)
  end

  def objects_count
    objects.count
  end

  def transfer_relations(to)
    objects.update_all(:survey_type_id => to.id)
  end
end