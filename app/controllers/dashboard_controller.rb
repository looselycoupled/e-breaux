class DashboardController < ApplicationController
  before_filter :require_authentication

  layout "authenticated"

  def index
  end  

  def report
    @subscriptions = Subscription.all
  end  

end
