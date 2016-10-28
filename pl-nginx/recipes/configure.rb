#
# Cookbook Name:: pl-nginx
# Recipe:: configure
#
# Configure vhost template and link the site in
#
# Copyright (c) 2016 The Authors, All Rights Reserved.


template "/etc/nginx/sites-available/#{node[:project]}" do
  source 'vhost.erb'
  notifies :restart, 'service[nginx]', :immediately
  variables ({
    :project => node[:project],
    :hostname => node[:hostname],
    :ip => node[:ip]
  })
end

nginx_site node[:project]

service 'nginx' do
  supports :status => true, :restart => true, :reload => true
  action [:enable, :start]
end
