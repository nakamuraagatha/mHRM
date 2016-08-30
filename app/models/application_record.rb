class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def can?(*args)
    args.map{|action| User.current.allowed_to? action }.include? true
  end

end
