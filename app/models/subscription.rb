class Subscription < ActiveRecord::Base
  belongs_to :facebook
  belongs_to :target
  
  def posts
    access_token = facebook.access_token
    FbGraph::User.fetch(target.identifier,:access_token => facebook.access_token).posts
  end

end
