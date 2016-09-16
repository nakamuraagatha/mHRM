class TaskNote < ApplicationRecord
  belongs_to :user
  belongs_to :task

  def self.safe_attributes
    [:note, :user_id ]
  end

end
