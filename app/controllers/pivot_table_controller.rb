class PivotTableController < ApplicationController
  before_action  :authenticate_user!

  before_filter :require_admin

  def index
  end
end
