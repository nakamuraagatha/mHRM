class HomeController < ApplicationController
  def index
    @setting = Setting.first || Setting.new
  end
end
