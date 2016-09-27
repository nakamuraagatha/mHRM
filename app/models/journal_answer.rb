class JournalAnswer < ApplicationRecord
  belongs_to :journal
  belongs_to :user

  def self.safe_attributes
    [:id, :answer, :journal_id, :user_id, :_destroy]
  end

end
