class Target < ActiveRecord::Base
  has_many :subscriptions
  has_many :facebooks, :through => :subscriptions
end