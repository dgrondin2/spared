set :application, "spared"
set :repository,  "git@github.com:dgrondin2/spared.git"

set :scm, :git
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

set :deploy_to, "/rails_apps/spared"
set :deploy_via, :remote_cache

role :web, "dominicgrondin.com"                          # Your HTTP server, Apache/etc
role :app, "dominicgrondin.com"                          # This may be the same as your `Web` server
role :db,  "dominicgrondin.com", :primary => true # This is where Rails migrations will run

set :user, "dgrondin"
set :password, "3lnsJK05rKiD"

set :scm_username, "dgrondin2"
set :scm_passphrase, "alakljf1"

set :use_sudo, false

# if you want to clean up old releases on each deploy uncomment this:
# after "deploy:restart", "deploy:cleanup"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
 namespace :deploy do
   task :start do ; end
   task :stop do ; end
   task :restart, :roles => :app, :except => { :no_release => true } do
     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
   end
 end