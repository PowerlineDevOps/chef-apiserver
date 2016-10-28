
# Pulls latest config files down

#if node[:env] == 'test'

#  test_parameters = "#{node[:deploy][:deploy_to]}/shared/config/parameters.travis.yml"

#  file '/srv/config/parameters.yml' do
#    content File.read(test_parameters)
#    owner node['web']['user']
#    group node['web']['group']
#  end

#else

  #include_recipe 'aws'

# pull the latest parameters.yml file
aws_s3_file '/srv/config/parameters.yml' do
  mode '0644'
  owner node['web']['user']
  group node['web']['group']
  bucket node[:s3_deployment_bucket]
  remote_path "#{node[:env]}/configs/parameters.yml"
  aws_access_key_id node[:aws_access_key]
  aws_secret_access_key node[:aws_secret_key]
end

#end

#link "/srv/config/parameters.yml" do
#  to "#{node[:deploy][:staging_dir]}/backend/app/config/parameters.yml"
#end
