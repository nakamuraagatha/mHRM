class EmployeesController < ApplicationController
  before_action  :authenticate_user!
  before_action  :set_employee, :only => [:show]
  before_action  :authorize

  def index
    @users = User.visible
  end

  def show

  end

  private

  def set_employee
    @employee = User.find params[:id]
  rescue ActiveRecord::RecordNotFound
    render_404
  end

  def authorize
    User.current.allowed_to?(:manage_roles)
  end

end
