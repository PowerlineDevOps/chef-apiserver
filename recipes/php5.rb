# fpm attributes
node.default['php']['version'] = '5.5.38'
#node.default['php']['fpm_user'] = node['project']['name']
#node.default['php']['fpm_group'] = node['project']['name']
#node.default['php']['fpm_package'] = 'php5-fpm'
#node.default['php']['fpm_service'] = 'php5-fpm'


include_recipe 'php::default'

# install packages
package ['php5-gd', 'php5-common', 'php5-curl', 'php5-mysql', 'php5-sqlite', 'php5-intl', 'php5-fpm']


