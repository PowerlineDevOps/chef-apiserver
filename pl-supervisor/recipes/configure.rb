
if ['test', 'dev'].include? node['civix']['env']
  env = 'dev'
else
  env = node['civix']['env']
end

supervisor_service "civix_push_queue" do
  action :enable
  command "php /srv/civix/app/console rabbitmq:consumer -m=10 push_queue -e=#{env}"
  autorestart true
  startretries 1000000000
  user node['user']
  redirect_stderr false
  stdout_logfile "/srv/log/push_civix.log"
  stdout_logfile_maxbytes 10MB
end

supervisor_service "civix_payments" do
  action [:enable, :start]
  command "php /srv/civix/app/console payment-request:start -e=#{env}"
  autorestart true
  user node['user']
  startretries 1000000000
  redirect_stderr false
  stdout_logfile "/srv/log/payments_civix.log"
  stdout_logfile_maxbytes 10MB
end

supervisor_service "civix_subscriptions" do
  action :enable
  command "php /srv/civix/app/console subscriptions-renew:start -e=#{env}"
  autorestart true
  user node['user']
  startretries 1000000000
  redirect_stderr false
  stdout_logfile "/srv/log/subscriptions_civix.log"
  stdout_logfile_maxbytes 10MB
end
