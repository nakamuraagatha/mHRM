class EmployeesController < ApplicationController
  before_action  :authenticate_user!
  before_action  :set_employee, :only => [:show]
  before_action :authorize_show, only: [:show]

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

  def authorize_show
    User.current.can?(:view_employee, :manage_employee)
  end

end
