class TargetsController < ApplicationController
  before_filter :require_authentication

  layout "authenticated"

  def index
  end

  def add
    
  end

  def subscribe
    # verify that the account is a friend
    redirect_to :add unless current_user.is_friend? params[:identifier]
    
    # find or create target
    t = Target.find_or_create_by_identifier(params[:identifier]) do |u|
      target = FbGraph::User.fetch(params[:identifier], :access_token => current_user.access_token)
      u.name = target.name
    end  
    
    # add to user's target list
    current_user.subscribe t
    
    flash[:notice] = "#{t.name} has been added to your target list"
    
    # return to target list
    redirect_to :action => :index #, :notice => "You have successfully logged out"
  end

  def unsubscribe
    Subscription.find(:first,params[:id]).delete.save
    redirect_to :action => :index, :notice => "Your target has been removed"
  end

  def delete
  end

end
