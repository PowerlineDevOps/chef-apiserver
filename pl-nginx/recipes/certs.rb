#
# Copy in the certs
#
crt_file = "/srv/certs/#{node[:project]}-server.crt"
key_file = "/srv/certs/#{node[:project]}-server.key"

if node['env'] == 'test'

  cookbook_file crt_file do
    source 'server.crt'
    owner node[:nginx][:user]
    group node[:nginx][:group]
    mode '0644'
  end

  cookbook_file key_file do
    source 'server.key'
    owner node[:nginx][:user]
    group node[:nginx][:group]
    mode '0644'
  end

else

  s3_bucket = node[:s3_deployment_bucket]
  s3_crt_url = "#{node[:env]}/certs/server.crt"
  s3_key_url = "#{node[:env]}/certs/server.key"

  #include_recipe 'aws'

  # cert file
  aws_s3_file crt_file do
    mode '0644'
    owner node[:nginx][:user]
    group node[:nginx][:group]
    bucket s3_bucket
    remote_path s3_crt_url
    aws_access_key_id node[:aws_access_key]
    aws_secret_access_key node[:aws_secret_key]
  end

  # key file
  aws_s3_file key_file do
    mode '0644'
    owner node[:nginx][:user]
    group node[:nginx][:group]
    bucket s3_bucket
    remote_path s3_key_url
    aws_access_key_id node[:aws_access_key]
    aws_secret_access_key node[:aws_secret_key]
  end

end
