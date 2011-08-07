class Response < ActiveRecord::Base
  belongs_to :facebook 
  belongs_to :post
  belongs_to :comment
  
  has_one :target, :through => :post
  
  
  def self.pending
    Response.where("respond_at < '#{Time.now}'").where(:active => true)
  end
  
  def self.posted
    Response.where("respond_at < '#{Time.now}'").where(:active => false)
  end
  
  def self.scheduled
    Response.where("respond_at > '#{Time.now}'")
  end
  
end
