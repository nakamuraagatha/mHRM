class ChecklistCase < ApplicationRecord
  belongs_to :case, foreign_key: :assigned_to_id
  belongs_to :checklist_template
end
