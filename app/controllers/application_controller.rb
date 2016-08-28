class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :find_optional_user
  layout 'base'

  def authorize(ctrl = params[:controller], action = params[:action])
    allowed = current_user.allowed_to?({:controller => ctrl, :action => action})
    if allowed
      true
    else
      flash[:error] = 'Permission denied'
      redirect_to root_path
      return false
    end
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
    render_404 unless current_user.admin?
  end

  def find_optional_user
    if params[:user_id]
      @user = User.find params[:user_id]
    end
  rescue ActiveRecord::RecordNotFound
    render_404
  end

end
