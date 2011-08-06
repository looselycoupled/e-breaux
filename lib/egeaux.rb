module Egeaux
  
  module Ebreaux
    
    def self.scan(target, access_token)
      # grab latest posts
      posts = fetch_posts(target, access_token)
      
      
    end
    
    # comment on a post
    def self.comment(target,person,message)
      
    end
    
    # like a post
    def self.like(target,person)
      
    end
    
    # schedule a future action (like or comment)
    def self.schedule
      
    end
    
    
    private
    
    def self.fetch_target(target, access_token)
      FbGraph::User.fetch(target, :access_token => access_token)
    end
    
    def self.fetch_posts(target, access_token)
      fb = fetch_target(target, access_token)
      fb.posts
    end
    
  end
  
end