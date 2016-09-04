class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true


  scope :visible, lambda {|action|  User.current.allowed_to?(action) ? for_employees :  where(user_id: User.current.id) }
  scope :for_employees, -> {where(user_id: User.employees.pluck(:id))}

  def can?(*args)
    owner? or args.map{|action| User.current.allowed_to? action }.include?(true)
  end

  def owner?
    self.try(:user) == User.current
  end

end
