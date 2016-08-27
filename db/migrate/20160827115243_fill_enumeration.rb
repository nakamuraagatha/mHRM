class FillEnumeration < ActiveRecord::Migration[5.0]
  def self.up
    ['Home', 'Business', 'Other'].each do |val|
      AddressType.create(name: val)
      EmailType.create(name: val)
      FaxType.create(name: val)
      PhoneType.create(name: val)
    end
    ['Facebook', 'Snapshat', 'Twitter' ,'Google pLus' ,'Instagram'].each do |val|
      SocialMediaType.create(name: val)
    end

    ['Driver license', 'Social security', 'Passport'].each do |val|
      IdentificationType.create(name: val)
    end

    ['HR manager', 'Hr specialist', 'Hr Generalist', 'HR assistant', 'Employee', 'Executive', 'Manager', 'Director'].each do |val|
      RoleType.create(name: val)
    end

    ['Resume', 'Education', 'Certification', 'Application'].each do |val|
      DocumentType.create(name: val)
    end

    ['Top secret', 'Secret', 'Public trust', 'None'].each do |val|
      ClearenceType.create(name: val)
    end

    ['CompTIA A+', 'CompTIA Network +', 'CompTIA Security +'].each do |val|
      CertificationType.create(name: val)
    end

    ['Associate Degree', 'Bachelors Degree', 'Masters Degree', 'Doctorate Degree', 'Graduate Degree'].each do |val|
      EducationType.create(name: val)
    end

    ['Christian', 'Muslim'].each do |val|
      ReligionType.create(name: val)
    end
    ['human Resource Management', 'Executive', 'InformationManagement', 'Business Development', 'Organizational Development', 'Finance', 'Program Management'].each do |val|
      DepartmentType.create(name: val)
    end

  end
  def self.down

  end
end
