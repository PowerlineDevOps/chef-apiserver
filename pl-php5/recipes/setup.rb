
# Add the php ppa to get php5.6
apt_repository "php" do
  uri "ppa:ondrej/php"
end

execute 'apt-get update' do
  command 'apt-get update'
  user 'root'
end

# php5 install packages
package ['php5.6', 'php5.6-gd', 'php5.6-common', 'php5.6-curl', 'php5.6-mysql', 'php5.6-sqlite', 'php5.6-intl', 'php5.6-fpm', 'php5.6-mbstring', 'php5.6-xml', 'php5.6-bcmath']

# enable but keep php5-fpm stopped for now
service 'php5.6-fpm' do
  action [:enable]
end

# Removing www pool
file '/etc/php/5.6/fpm/pool.d/www.conf' do
  action :delete
end
