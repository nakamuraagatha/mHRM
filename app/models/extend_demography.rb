class ExtendDemography < ApplicationRecord

  has_many :emails, foreign_key: :extend_demography_id
  accepts_nested_attributes_for :emails, reject_if: :all_blank, allow_destroy: true
  has_many :faxes, foreign_key: :extend_demography_id
  accepts_nested_attributes_for :faxes, reject_if: :all_blank, allow_destroy: true
  has_many :phones, foreign_key: :extend_demography_id
  accepts_nested_attributes_for :phones, reject_if: :all_blank, allow_destroy: true
  has_many :identifications, foreign_key: :extend_demography_id
  accepts_nested_attributes_for :identifications, reject_if: :all_blank, allow_destroy: true

  has_many :addresses, foreign_key: :extend_demography_id
  accepts_nested_attributes_for :addresses, reject_if: :all_blank, allow_destroy: true
  has_many :social_media, foreign_key: :extend_demography_id
  accepts_nested_attributes_for :social_media, reject_if: :all_blank, allow_destroy: true

  def object

  end
end
