class Post < ActiveRecord::Base
  belongs_to :target
  has_many :responses
  
end
