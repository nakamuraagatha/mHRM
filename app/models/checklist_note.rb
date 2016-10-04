class ChecklistNote < Note
  belongs_to :checklist_template, foreign_key: :owner_id

  def object
    checklist_template
  end
end