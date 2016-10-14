#
# Cookbook Name:: powerline-chef-apiserver
# Recipe:: webservices
#
# Configure webservices
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

template "/etc/php5/fpm/pool.d/#{node['project']['name']}.conf" do
  source 'fpm.conf.erb'
  notifies :restart, 'service[php5-fpm]', :immediately
  variables ({
    :project => node['project']['name']
  })
end

service 'php5-fpm' do
  supports :status => true, :restart => true, :reload => true
  action [:enable, :start]
end

template "/etc/nginx/sites-available/#{node['project']['name']}" do
  source 'vhost.erb'
  notifies :restart, 'service[nginx]', :immediately
  variables ({
    :project => node['project']['name'],
    :hostname => node['hostname'],
    :ip => node['ip']
  })
end

nginx_site "#{node['project']['name']}"

service 'nginx' do
  supports :status => true, :restart => true, :reload => true
  action [:enable, :start]
end
