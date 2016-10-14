#
# Cookbook Name:: powerline-chef-apiserver
# Recipe:: setup
#
# Basic API Server setup
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

include_recipe 'powerline-chef-baseline::default'

%w{/srv/certs /srv/civix /srv/staging}.each do |d|
  directory d do
    owner 'civix'
    group 'civix'
    mode '0755'
    recursive true
  end
end

# python
python_runtime 'api-server' do
  version '2.7'
  provider :system
end

# php5
node.default['php']['version'] = '5.5'
include_recipe 'php::default'

# php5 install packages
package ['php5-gd', 'php5-common', 'php5-curl', 'php5-mysql', 'php5-sqlite', 'php5-intl', 'php5-fpm']

# enable php5-fpm
service 'php5-fpm' do
  action [:enable]
end

# services
include_recipe 'supervisor::default'
include_recipe 'rabbitmq::default'
include_recipe 'nginx::default'
