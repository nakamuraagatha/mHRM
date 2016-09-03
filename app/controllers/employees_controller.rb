class EmployeesController < ApplicationController
  before_action  :authenticate_user!
  before_action  :set_employee, :only => [:show, :destroy,
                                          :log_in, :update, :change_password]
  before_action  :authorize

  def index
    @users = User.visible
  end

  def show

  end

  def change_password
    if params[:password] == params[:password_confirmation]
      if @employee.update(password: params[:password])
        flash[:notice] = I18n.t('devise.passwords.updated_not_active')
      else
        flash[:notice] = I18n.t('error_update')
      end
    else
      flash[:error] = 'Password not matched'
    end
    redirect_to employee_path(@employee)
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
