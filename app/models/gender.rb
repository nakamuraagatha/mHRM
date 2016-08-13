class Gender < ApplicationRecord
  has_many :core_demographics

  validates_presence_of :gender
  validates_uniqueness_of :gender


  def self.gender_for_select
    pluck :gender, :id
  end
  
end
