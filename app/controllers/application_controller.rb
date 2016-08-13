class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  layout 'base'

  # Attempt to find the mapped route for devise based on request path
  def devise_mapping
    @devise_mapping ||= request.env["devise.mapping"]
  end

end
