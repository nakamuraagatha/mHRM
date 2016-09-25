class HomeController < ApplicationController
  before_filter :require_admin, only: [:pivottable]
  def index
    if session[:employee_id]
      @employee = User.find session[:employee_id]
      session[:employee_id] = nil
      flash[:notice]= "Logged Off from #{@employee.login}"
      redirect_to root_path
    end
    @setting = Setting.first || Setting.new
  end

  def pivottable

  end
end
