class WelcomeController < ApplicationController
  
  layout :choose_layout
  
  def index
    if !current_user.nil?
      redirect_to :controller => :dashboard
    end
  end

  def about
  end

  def login
  end
  
  def logout
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
