class AffiliationExtendDemography < ExtendDemography
  belongs_to :affiliation

  def object
    affiliation
  end
end
