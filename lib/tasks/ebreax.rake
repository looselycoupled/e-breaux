# require 'egeaux'
namespace :ebreaux do

  desc "Pulls new posts from targets"
  task :scan => :environment do 
    targets = []
    message = "#{Time.now} Scanning for new posts"
    puts message
    # logger.info(message)
    Subscription.all.each do |s|
      if !targets.include?(s.target)
        targets << s.target
        puts "Beginning scan for #{s.target.name}"
        Egeaux::Ebreaux.scan(s)
      end
    end

  end


  desc "Checks for pending Comments and Likes"
  task :respond => :environment do
    Response.pending.each do |r|
      puts "\nOriginal Post\n#{r.post.message}\n\nComment\n#{r.comment.message}"
      p = FbGraph::Post.fetch(r.post.identifier, :access_token => r.facebook.access_token)
      p.comment!(:message => r.comment.message)
      r.active = false
      r.save
    end
  end


end