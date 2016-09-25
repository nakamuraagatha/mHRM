class ChecklistAnswer < ApplicationRecord
  belongs_to :user
  belongs_to :checklist
  belongs_to :checklist_template

  def self.safe_attributes
    [:id, :checklist_id,  :user_id, :due_date, :_destroy]
  end

end
