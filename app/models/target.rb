class Target < ActiveRecord::Base
  has_many :subscriptions
  has_many :facebooks, :through => :subscriptions
  has_many :posts do
    def latest
      find(:last)
    end
  end
  
  
  
end
