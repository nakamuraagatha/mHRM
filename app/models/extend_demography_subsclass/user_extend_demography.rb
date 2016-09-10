class UserExtendDemography < ExtendDemography
  belongs_to :user
  def object
    user
  end
end
