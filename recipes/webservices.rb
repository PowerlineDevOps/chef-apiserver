

%w{/srv/certs /srv/civix}.each do |d|
  directory d do
    owner 'civix'
    group 'civix'
    mode '0755'
    recursive true
  end
end



service 'php5-fpm' do
  supports :status => true, :restart => true, :reload => true
  action [:enable, :start]
end

template "/etc/php5/fpm/pool.d/#{node['project']['name']}.conf" do
  source 'fpm.conf.erb'
  notifies :restart, 'service[php5-fpm]', :immediately
  variables ({
    :project => node['project']['name']
  })
end



include_recipe 'nginx::default'

nginx_site 'default' do
  enable false
end

template "/etc/nginx/sites-available/#{node['project']['name']}" do
  source 'vhost.erb'
  #notifies :restart, 'service[nginx]', :immediately
  variables ({
    :project => node['project']['name'],
    :hostname => node['hostname'],
    :ip => node['ip']
  })
end

nginx_site "#{node['project']['name']}"

