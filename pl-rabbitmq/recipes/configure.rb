
rabbitmq_vhost node[:rabbitmq_vhost] do
  action :add
end

rabbitmq_user node[:rabbitmq_user] do
  password node[:rabbitmq_passwd]
  action :add
end

rabbitmq_user node[:rabbitmq_user] do
  vhost node[:rabbitmq_vhost]
  permissions ".* .* .*"
  action :set_permissions
end
