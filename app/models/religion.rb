class Religion < ApplicationRecord
  has_many :core_demographics

  validates_presence_of :religion
  validates_uniqueness_of :religion


  def self.religion_for_select
    pluck :religion, :id
  end
end
