class DashboardController < ApplicationController
  before_filter :require_authentication

  layout "authenticated"

  def index
    
  end

end
