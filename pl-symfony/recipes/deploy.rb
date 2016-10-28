
is_dev = false

case node[:civix][:env]
when 'test', 'dev'
  branch = 'develop'
  is_dev = true
when 'staging'
  branch = 'master'
else
  branch = default[:deploy][:branch]
end



deploy node[:deploy][:deploy_to] do

  user 'civix'
  group 'civix'
  revision branch
  repo 'https://github.com/PowerlineApp/powerline-server.git'

  symlink_before_migrate ({})

end
 # A this point, the code is not yet checkouted
 # before_deploy do
 #   %w(app/sessions app/logs vendor).each do |dir|
 #     directory "#{shared_path}/#{dir}" do
 #       owner 'civix'
 #       group 'civix'
 #       action :create
 #       recursive true
 #     end
 #   end
 # end

  # A this point, the code is checkouted, but not yet deployed
 # before_migrate do

#    file "#{release_path}/web/app_dev.php" do
 #     action :delete
 #     not_if { is_dev }
 #   end

 #   include_recipe 'powerline-chef-apiserver::config_file'

#    include_recipe 'composer'
#    composer_project '/srv/staging/server/backend' do
#       user 'civix'
#        group 'civix'
#        dev is_dev
#        #quiet true # Do not output any message.
#        optimize_autoloader !is_dev # Convert PSR 0-4 autoloading to classmap to get a faster autoloader. (Recommended for production)
  #      action :install
 #   end



#end

#  repository "https://github.com/PowerlineApp/powerline-server.git"
#  revision branch
#  action :sync
#  user 'civix'
#  group 'civix'
#end

# pulls latest config
#
# This needs to change so that we build the parameters.yml
# from a template. Using this method for now.
#include_recipe 'powerline-chef-apiserver::config_file'

#include_recipe 'composer'
#composer_project '/srv/staging/server/backend' do
#    user 'civix'
#    group 'civix'
#    dev is_dev
#    #quiet true # Do not output any message.
#    optimize_autoloader !is_dev # Convert PSR 0-4 autoloading to classmap to get a faster autoloader. (Recommended for production)
#    action :install
#end


#execute 'clean_symfony_cache' do
#    user 'myuser'
#    group 'mygroup'
#    cwd '/path/to/app/Symfony'
#    command "php app/console cache:clear --env=prod --no-debug"
#    action :run
#end

#execute 'warmup_symfony_cache_prod' do
#    user 'myuser'
#    group 'mygroup'
#    cwd '/path/to/app/Symfony'
#    command "php app/console cache:warmup --env=prod --no-debug"
#    action :run
#end
