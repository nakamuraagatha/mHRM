class CaseNote < Note
  belongs_to :case_root, foreign_key: :owner_id, class_name: 'Case'

  def object
    case_root
  end
end