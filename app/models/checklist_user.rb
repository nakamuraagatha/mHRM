class ChecklistUser < ApplicationRecord
  belongs_to :user, foreign_key: :assigned_to_id
  belongs_to :checklist_template
end
