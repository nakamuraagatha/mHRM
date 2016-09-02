class SocialMedium < ApplicationRecord
  belongs_to :extend_demography
  belongs_to :social_media_type

  validates_presence_of :social_media_handle, :social_media_type_id
  validates_uniqueness_of :social_media_type_id, scope: [:extend_demography_id]

  def self.safe_attributes
    [:id, :social_media_type_id, :social_media_handle, :note, :_destroy]
  end

end
