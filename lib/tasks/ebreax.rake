# require 'egeaux'
namespace :ebreaux do

  desc "Pulls new posts from targets"
  task :scan => :environment do 
  
    Subscription.all.each do |s|
      Egeaux::Ebreaux.scan(s)
    end

  end


  desc "Checks for pending Comments and Likes"
  task :respond => :environment do
    # Response.pending.each do |r|
    # 
    # end
  end


end