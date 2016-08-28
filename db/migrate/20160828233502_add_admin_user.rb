class AddAdminUser < ActiveRecord::Migration[5.0]
  def change
    user = User.new(email: 'admin@example.net', admin: true, password: 'admin', login: 'admin' )

    user.save
  end
end
