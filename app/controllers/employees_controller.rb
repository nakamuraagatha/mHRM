class EmployeesController < ApplicationController
  before_action  :authenticate_user!
  before_action  :set_employee, :only => [:show, :destroy, :log_in]
  before_action  :authorize

  def index
    @users = User.visible
  end

  def show

  end

  def log_in
    session[:employee_id] = @employee.id
    flash[:notice]= "Logged In from #{@employee.login}"
    redirect_to root_path
  end

  def destroy
    session[:employee_id] = nil
    flash[:notice]= "Logged Off from #{@employee.login}"
    redirect_to root_path
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
