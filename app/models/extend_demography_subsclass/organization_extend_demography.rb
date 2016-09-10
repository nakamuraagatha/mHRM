class OrganizationExtendDemography < ExtendDemography
  belongs_to :organization

  def object
    organization
  end
end
