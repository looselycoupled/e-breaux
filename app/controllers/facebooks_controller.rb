require 'rack/oauth2'

class FacebooksController < ApplicationController
  before_filter :require_authentication, :only => :destroy

  # handle Normal OAuth flow: start
  def new
    redirect_to client.authorization_uri(
      :scope => Facebook.config[:perms]
    )
  end

  # handle Normal OAuth flow: callback
  def create
    # save code and access_token
    client.authorization_code = params[:code]
    access_token = client.access_token!
    
    # fetch user details (identifier)
    user = FbGraph::User.me(access_token).fetch

    # create facebook record if needed; save session/cookie data
    Facebook.identify(user)
    
    # redirect to confirmation_url
    redirect_to :action => :confirm
  end
  
  def confirm
    
  end

  private

  def client
    unless @client
      @client = Facebook.auth.client
      @client.redirect_uri = callback_facebook_url
    end
    @client
  end

end
