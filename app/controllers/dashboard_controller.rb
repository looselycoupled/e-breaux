class DashboardController < ApplicationController
  before_filter :require_authentication

  layout "authenticated"

  def index
    # @posts = Egeaux::Ebreaux.scan(current_user.access_token)
    # access_token = current_user.access_token

    # access_token = Facebook.last.access_token
    # 
    # 
    # # code belongs in lib
    # fb = FbGraph::User.me(access_token).fetch
    # @posts = fb.posts
    
  end
  
  # scan for new posts.  schedule responses
  def scan_new_posts
    # *** scan for new posts ***
    subscriptions = Subscription.all
    subscriptions.each {|s|
      
    }
    
    # *** schedule responses ***
    
  end
  
  # 
  def post
    
  end

end
