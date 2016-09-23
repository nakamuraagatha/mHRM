class Unauthorized < Exception; end

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :set_user
  before_action :module_visible
  layout 'base'


  def set_user
    if user_signed_in?
      if params[:user_id]
        @user = User.find params[:user_id]
        User.current = current_user
      elsif session[:employee_id]
        User.current = User.find session[:employee_id]
        @user = User.current
      elsif params[:employee_id]
        User.current = User.find params[:employee_id]
        @user = User.current
        session[:employee_id] = User.current.id
      else
        User.current = current_user
        @user = User.current
      end
    end
  rescue ActiveRecord::RecordNotFound
    render_404
  end

  def module_visible
    if EnabledModule.where(name: params[:controller], status: false).present?
      render_404
    end
  end

  def authorize(ctrl = params[:controller], action = params[:action])
    allowed = current_user.allowed_to?({:controller => ctrl, :action => action})
    allowed ?  true : deny_access
  end
  rescue_from ::Unauthorized, :with => :deny_access

  def deny_access
    User.current ? render_403 : require_login
  end

  def require_login
    redirect_to new_session_path(:user)
  end

  def render_403(options={})
    @project = nil
    render_error({:message => :notice_not_authorized, :status => 403}.merge(options))
    return false
  end

  def render_404(options={})
    render_error({:message => :notice_file_not_found, :status => 404}.merge(options))
    return false
  end

  # Renders an error response
  def render_error(arg)
    arg = {:message => arg} unless arg.is_a?(Hash)

    @message = arg[:message]
    @message = @message if @message.is_a?(Symbol)
    @status = arg[:status] || 500

    respond_to do |format|
      format.html {
        render :template => 'common/error', :layout => 'base', :status => @status
      }
      format.any { head @status }
    end
  end

  def require_admin
    render_404 unless User.current.admin?
  end
end
