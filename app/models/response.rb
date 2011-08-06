class Response < ActiveRecord::Base
  belongs_to :facebook 
  belongs_to :post
  belongs_to :comment
  
  has_one :target, :through => :post
end
