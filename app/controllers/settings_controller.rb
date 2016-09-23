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

  def set_modules
    ems = EnabledModule.pluck(:name)
    rejected_modules = ems.reject{|em| params.has_key? em}
    selected_modules = ems.select{|em| params.has_key? em}
    EnabledModule.where(name: selected_modules).update_all({status: true})
    EnabledModule.where(name: rejected_modules).update_all({status: false})
    redirect_to settings_path
  end

  private

  def setting_params
    params.require(:setting).permit(:home_page_content)
  end

end
