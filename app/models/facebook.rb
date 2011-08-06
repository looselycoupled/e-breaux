class Facebook < ActiveRecord::Base
  has_many :subscriptions 
  has_many :responses
  has_many :targets, :through => :subscriptions

  def profile
    @profile ||= FbGraph::User.me(access_token).fetch
  end

  def friends
    @friends ||= profile.friends
  end

  def posts
    @posts ||= profile.home
  end


  def is_friend?(target)
    identifier = (target.instance_of? String) ? target : target.identifier
    friends.any?{|f| f.identifier == identifier}
  end

  def is_target?(target)
    identifier = (target.instance_of? String) ? target : target.identifier
    targets.any?{|f| f.identifier == identifier}
  end

  def subscribe(target)
    targets << target
  end
  
  # def unsubscribe(target)
  #   identifier = (target.instance_of? String) ? target : target.identifier
  #   targets.find_by_identifier(identifier).delete
  # end

  class << self
    extend ActiveSupport::Memoizable

    def config
      @config ||= if ENV['fb_client_id'] && ENV['fb_client_secret'] && ENV['fb_perms']
        {
          :client_id     => ENV['fb_client_id'],
          :client_secret => ENV['fb_client_secret'],
          :perms         => ENV['fb_perms']
        }
      else
        YAML.load_file("#{Rails.root}/config/facebook.yml")[Rails.env].symbolize_keys
      end
    rescue Errno::ENOENT => e
      raise StandardError.new("config/facebook.yml could not be loaded.")
    end

    def auth
      FbGraph::Auth.new config[:client_id], config[:client_secret]
    end

    def identify(fb_user)
      _fb_user_ = find_or_initialize_by_identifier(fb_user.identifier.try(:to_s))
      _fb_user_.access_token = fb_user.access_token.access_token
      _fb_user_.save!
      _fb_user_
    end
  end

end
