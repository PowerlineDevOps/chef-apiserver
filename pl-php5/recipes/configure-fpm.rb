
template "/etc/php/5.6/fpm/pool.d/#{node[:project]}.conf" do
  source 'fpm.conf.erb'
  notifies :restart, 'service[php5.6-fpm]', :immediately
  variables ({
    :project => node[:project],
    :user => node[:fpm_user],
    :group => node[:fpm_group]
  })
end

service 'php5.6-fpm' do
  supports :status => true, :restart => true, :reload => true
  action [:start]
end
