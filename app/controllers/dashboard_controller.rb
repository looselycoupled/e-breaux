class DashboardController < ApplicationController
  before_filter :require_authentication

  layout "authenticated"

  def index
  end
  
  # scan for new posts.  schedule responses
  def scan_new_posts
    # *** scan for new posts ***
    subscriptions = Subscription.all
    subscriptions.each {|s|
      
    }
    
    # *** schedule responses ***
    
  end
  
  
  private 
  
  def fetch_target(target, access_token)
    FbGraph::User.fetch(target.identifier, :access_token => access_token)
  end
  
  def fetch_posts(target, access_token)
    fb = fetch_target(target, access_token)
    fb.posts
  end
  
  
  
  
  
  
  

end
