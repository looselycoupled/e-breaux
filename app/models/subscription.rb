class Subscription < ActiveRecord::Base
  belongs_to :facebook
  belongs_to :target

end
