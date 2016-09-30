class ChecklistUser < ApplicationRecord
  belongs_to :user
  belongs_to :checklist_template
end
