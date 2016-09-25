class Checklist < ApplicationRecord
  belongs_to :checklist_template

  def self.safe_attributes
    [:id, :description, :user_id, :due_date, :_destroy]
  end

end
