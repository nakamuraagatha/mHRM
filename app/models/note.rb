class Note < ApplicationRecord
  belongs_to :user

  def self.safe_attributes
    [:user_id, :owner_id, :type, :note]
  end

  def object

  end

end
