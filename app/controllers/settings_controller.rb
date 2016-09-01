class SettingsController < ApplicationController
  before_action  :authenticate_user!

  before_filter :require_admin

  def index
    @setting = Setting.first || Setting.new
  end

  def create
    @setting = Setting.first || Setting.new
    @setting.attributes= setting_params
    @setting.save
    redirect_to settings_path
  end

  private

  def setting_params
    params.require(:setting).permit(:home_page_content)
  end

end
