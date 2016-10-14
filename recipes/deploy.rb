
directory "#{node[:deploy][:deploy_to]}" do
  group node[:nginx][:group]
  owner node[:nginx][:user]
  mode "0775"
  action :create
  recursive true
end

case node[:civix][:env]
when 'test', 'dev'
  branch = 'develop'
when 'staging'
  branch = 'master'
else
  branch = default[:deploy][:branch]
end

git "/srv/staging/server" do
    repository "git@github.com:PowerlineApp/powerline-server.git"
    revision branch
    action :sync
end

# This needs to change so that we build the parameters.yml
# from a template. Using this method for now.
include_recipe 'aws'
aws_s3_file "/srv/parameters.yml" do
  bucket "deployment-data"
  remote_path "#{node[:civix][:env]}/configs/parameters.yml"
  aws_access_key_id node['aws']['access_key']
  aws_secret_access_key node['aws']['secret_key']
end


#include_recipe 'composer'
#composer_project '/srv/civix/app' do
#    user 'civix'
#    group 'civix'
#    dev false # Ensures that development packages are not installed in the production environment.
#    quiet true # Do not output any message.
#    optimize_autoloader true # Convert PSR 0-4 autoloading to classmap to get a faster autoloader. (Recommended for production)
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
