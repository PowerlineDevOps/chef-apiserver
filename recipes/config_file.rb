
# Pulls latest config files down

include_recipe 'aws'

# setup only if missing
directory '/srv/config' do
  owner node['nginx']['user']
  group node['nginx']['group']
  action :create_if_missing
end

# pull the latest parameters.yml file
aws_s3_file '/srv/config/parameters.yml' do
  mode '0644'
  owner node['nginx']['user']
  group node['nginx']['group']
  bucket node['civix']['s3']['deployment_bucket']
  remote_path "#{node['civix']['env']}/configs/parameters.yml"
  aws_access_key_id node['aws']['access_key']
  aws_secret_access_key node['aws']['secret_key']
end
