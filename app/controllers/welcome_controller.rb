class WelcomeController < ApplicationController
  
  layout :choose_layout
  
  def index
    redirect_to dashboard_url if authenticated?
  end

  def about
  end

  def logout
    unauthenticate
    redirect_to root_url
  end

  def privacy
  end


  private
  
  def choose_layout
    if current_user.nil?
      "unauthenticated"
    else
      "authenticated"
    end
  end
end
