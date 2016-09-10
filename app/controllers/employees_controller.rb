class EmployeesController < ApplicationController
  before_action  :authenticate_user!
  before_action  :set_employee, :only => [:show, :destroy, :log_in, :update]
  before_action  :authorize

  def index
    @users = User.visible
  end

  def show

  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params.require(:user).permit(employee_params))
    if @user.save
      UserMailer.welcome_email(@user, params[:user][:password]).deliver_now
    end
    redirect_to users_url
  end

  def update
    if @employee.update(params.require(:user).permit(User.safe_attributes))
      flash[:notice] = I18n.t('notice_successful_update')
    else
      flash[:error] = I18n.t('error_update')
    end
    redirect_to employee_path(@employee)
  end

  def log_in
    session[:employee_id] = @employee.id
    flash[:notice]= "Logged In from #{@employee.login}"
    redirect_to employee_path(@employee)
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

  def employee_params
    User.current.admin? ? User.admin_safe_attributes :  User.safe_attributes_with_password
  end
end
