module Egeaux
  
  module Ebreaux
    
    def self.scan(subscription)
      target = subscription.target
      access_token = subscription.facebook.access_token
      
      # grab latest posts
      posts = fetch_posts(target, access_token)

      # save most recent post if it's new
      if (target.posts.latest.try(:identifier) != posts.first.identifier) 
        p = posts.first
        post = Post.new
        post.identifier = p.identifier
        post.message = p.message
        post.fb_created_time = p.created_time
        post.target = target
        post.save
        
        schedule_responses(post)
      end

      
    end
    
    # comment on a post
    def self.comment(target,person,message)
      
    end
    
    # like a post
    def self.like(target,person)
      
    end
    
    # schedule a future action (like or comment)
    def self.schedule(user,target)
      # r = Response.new
      # if comment?
      #   
      # end
      # (rand(59) +2).minutes.from_now
    end
    
    
    private
    
    def schedule_responses(post)
      
      post.target.subscriptions.each do |s|
        user = s.facebook
        target = s.target
        
        schedule(user,target)
        
      end
      
    end
    
    
    def self.fetch_target(target, access_token)
      FbGraph::User.fetch(target.identifier, :access_token => access_token)
    end
    
    def self.fetch_posts(target, access_token)
      fb = fetch_target(target, access_token)
      posts = fb.posts
      posts.map{|p| p unless p.message.nil? }
    end
    
    # default to comment 1/4 of time
    def comment?
      if rand(4) == 0
        false
      else
        true
      end
    end
    
  end
  
end