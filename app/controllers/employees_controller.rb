class EmployeesController < ApplicationController
  before_action  :authenticate_user!
  before_action :authorize, only: [:index]

  def index
    @users = User.visible
  end

end
