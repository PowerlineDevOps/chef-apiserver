
default[:project][:name] = 'civix'

# app cookbook overrides
default[:nginx][:user] = 'civix'
default[:nginx][:group] = 'civix'

# ================ deploy =============
default[:deploy][:shell] = '/bin/bash'
default[:deploy][:deploy_keep_releases] = 5
default[:deploy][:deploy_to] = '/srv/civix/web'
default[:deploy][:branch] = 'develop'


# ================ parameters.yml ============

# database
default[:civix][:db][:user] =''
default[:civix][:db][:name] = 'civix'
default[:civix][:db][:passwd] = ''
default[:civix][:db][:host] = '127.0.0.1'
#
default[:civix][:secret] = 'ThisTokenIsNotSoSecretChangeIt'
default[:civix][:domain] = 'dev.powerli.ne'
# mailer
default[:civix][:mailer][:user] = 'changeme'
default[:civix][:mailer][:passwd] = 'changeme'
# s3
default[:civix][:s3][:key] = 'changeme'
default[:civix][:s3][:secret] = 'changeme'
default[:civix][:s3][:bucket] = 'changeme'
default[:civix][:s3][:url] = 'changeme'
default[:civix][:s3][:deployment_bucket] = 'deployment-data'
# sns
default[:civix][:sns][:anroid_arn] = 'changeme'
default[:civix][:sns][:ios_arn] = 'changeme'
# cicero
default[:civix][:cicero][:user] = 'aplotnikov'
default[:civix][:cicero][:passwd] = 'aplotnikov'
# recaptcha
default[:civix][:recaptcha][:public] = 'changeme'
default[:civix][:recaptcha][:private] = 'changeme'
# andriod
default[:civix][:android][:api_key] = 'changeme'
default[:civix][:android][:app] = 'changeme'
# ios
default[:civix][:ios][:pem] = 'changeme'
# sunlightapi
default[:civix][:sunlight][:token] = 'changeme'
# balanced
default[:civix][:balanced][:api_key] = 'changeme'
default[:civix][:balanced][:id] = 'changeme'
# stripe
default[:civix][:stripe][:api_key] = 'sk_test_vpedTPsiXZZ8SSwS4isZzHWw'
default[:civix][:stripe][:pub] = 'pk_test_QUgSE3ZhORW9yoDuCkMjnaA2'
#rabbitmq
default[:civix][:rabbitmq][:user] = 'civix'
default[:civix][:rabbitmq][:passwd] = 'civix'
default[:civix][:rabbitmq][:vhost] = 'civix'
# mailgun
default[:civix][:mailgun][:public] = 'changeme'
default[:civix][:mailgun][:private] = 'changeme'
# imgix
default[:civix][:imgix][:domain] = 'changeme'
# facebook
default[:civix][:facebook][:id] = 'changeme'
default[:civix][:facebook][:secret] = 'changeme'
