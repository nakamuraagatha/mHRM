class ExtendDemography < ApplicationRecord
  belongs_to :user

  has_many :emails
  accepts_nested_attributes_for :emails, reject_if: :all_blank, allow_destroy: true
  has_many :faxes
  accepts_nested_attributes_for :faxes, reject_if: :all_blank, allow_destroy: true
  has_many :phones
  accepts_nested_attributes_for :phones, reject_if: :all_blank, allow_destroy: true
  has_many :identifications
  accepts_nested_attributes_for :identifications, reject_if: :all_blank, allow_destroy: true

  has_many :addresses
  accepts_nested_attributes_for :addresses, reject_if: :all_blank, allow_destroy: true
  has_many :social_media
  accepts_nested_attributes_for :social_media, reject_if: :all_blank, allow_destroy: true


end
