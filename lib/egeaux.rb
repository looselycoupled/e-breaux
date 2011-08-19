module Egeaux
  
  module Ebreaux

    def self.reset
      Response.delete_all
      Post.delete_all
    end
    
    def self.scan(subscription)
      target = subscription.target
      access_token = subscription.facebook.access_token
      
      # grab latest posts
      posts = fetch_posts(target, access_token)

      # save most recent post if it's new and schedule response
      if (target.posts.latest.try(:identifier) != posts.first.identifier) 
        puts "New post found for #{target.name}"
        p = posts.first
        post = Post.new
        post.identifier = p.identifier
        post.message = p.message
        post.fb_created_time = p.created_time
        post.target = target
        post.save
        
        puts "Scheduling responses..."
        responses = schedule_responses(post)
        puts "#{responses.length} responses scheduled"
      else
        puts "No new posts found"
      end

      
    end
    
    # comment on a post
    def self.comment(target,person,message)
      
    end
    
    # like a post
    def self.like(target,person)
      
    end
    
    
    private
    
    def self.schedule_responses(post)
      responses = []
      post.target.subscriptions.each do |s|
        responses << schedule(s.facebook, post)
      end
      responses
    end

    # schedule a future action (like or comment)
    def self.schedule(user, post)
      r = Response.new
      r.facebook = user
      r.post = post
      # if comment?
        r.comment = Comment.random
      # end
      r.respond_at = (rand(59) +2).minutes.from_now
      r.save
      r
    end
    
    
    
    def self.fetch_target(target, access_token)
      FbGraph::User.fetch(target.identifier, :access_token => access_token)
    end
    
    def self.fetch_posts(target, access_token)
      fetched_posts = []
      fb = fetch_target(target, access_token)
      posts = fb.posts
      posts.each {|p|
        if !p.message.nil?
          fetched_posts << p
        end
      }
      fetched_posts
    end
    
    # default to comment 1/4 of time
    def self.comment?
      if rand(4) == 0
        false
      else
        true
      end
      # added for testing
      true
    end
    
  end
  
end