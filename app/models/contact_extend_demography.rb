class ContactExtendDemography < ExtendDemography
  belongs_to :contact

  def object
    contact
  end
end
