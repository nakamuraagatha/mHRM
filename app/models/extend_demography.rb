class ExtendDemography < ApplicationRecord
  belongs_to :user

  has_many :emails
  accepts_nested_attributes_for :emails, reject_if: :all_blank, allow_destroy: true
  has_many :faxes
  accepts_nested_attributes_for :faxes, reject_if: :all_blank, allow_destroy: true
  has_many :phones
  accepts_nested_attributes_for :phones, reject_if: :all_blank, allow_destroy: true

  has_one :identification
  accepts_nested_attributes_for :identification


end
