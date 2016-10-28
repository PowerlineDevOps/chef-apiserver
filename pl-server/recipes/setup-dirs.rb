

%w{/srv/staging /srv/config }.each do |d|
  directory d do
    owner node[:web][:user]
    group node[:web][:group]
    mode '0755'
    recursive true
  end
end
