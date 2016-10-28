
# Set some overrides
node.default['nginx']['user'] = 'civix'
node.default['nginx']['group'] = 'civix'

# make sure civix user is available
include_recipe 'powerline-chef-baseline::users'

# Create the necessary dirs
%w{/srv/certs /srv/civix /srv/civix/web }.each do |d|
  directory d do
    owner node[:nginx][:user]
    group node[:nginx][:group]
    mode '0755'
    recursive true
  end
end

# update apt
execute 'apt-get update' do
  command 'apt-get update'
  user 'root'
end

include_recipe 'chef_nginx::default'
