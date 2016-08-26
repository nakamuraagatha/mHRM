module UsersHelper
  def password_min
    User.password_length.min
  end

  def password_max
    User.password_length.max
  end
end
