require 'bundler/capistrano'

set :application, "ebreaux.webnerdery.com"
set :repository,  "git@github.com:looselycoupled/e-breaux.git"

set :scm, :git
set :scm_verbose, true

set :user, 'allenleis'
set :use_sudo, false
set :deploy_to, "/home/allenleis/webapps/e_breaux/site"


role :web, "allenleis.webfactional.com"                          # Your HTTP server, Apache/etc
role :app, "allenleis.webfactional.com"                          # This may be the same as your `Web` server
role :db,  "allenleis.webfactional.com", :primary => true # This is where Rails migrations will run

default_environment['PATH']='/home/allenleis/webapps/e_breaux/gems/bin:/usr/kerberos/bin:/usr/local/bin:/bin:/usr/bin:/home/allenleis/bin:/home/allenleis/bin'
default_environment['GEM_PATH']='/home/allenleis/webapps/e_breaux/gems:/home/allenleis/webapps/e_breaux/site/shared/bundle'
default_environment['GEM_HOME']='/home/allenleis/webapps/e_breaux/gems:/home/allenleis/webapps/e_breaux/site/shared/bundle'


namespace :bundle do
  task :install do
    run "bundle install --gemfile #{latest_release}/Gemfile --path /home/allenleis/webapps/e_breaux/site/shared/bundle --deployment --quiet --without development test"
  end
end

namespace :deploy do  
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    # run "#{deploy_to}/../bin/restart"
  end
  
end
