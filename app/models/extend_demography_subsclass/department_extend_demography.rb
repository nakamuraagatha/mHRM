class DepartmentExtendDemography < ExtendDemography
  belongs_to :department

  def object
    department
  end
end
