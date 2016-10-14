
rabbitmq_vhost "#{node['civix']['rabbitmq']['vhost']}" do
  action :add
end

rabbitmq_user "#{node['civix']['rabbitmq']['user']}" do
  password node['civix']['rabbitmq']['passwd']
  action :add
end

rabbitmq_user "#{node['rabbitmq']['default_user']}" do
  vhost node['civix']['rabbitmq']['vhost']
  permissions ".* .* .*"
  action :set_permissions
end
