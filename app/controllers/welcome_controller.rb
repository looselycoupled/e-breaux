class WelcomeController < ApplicationController
  
  layout :choose_layout
  
  def index
    
  end

  def about
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
