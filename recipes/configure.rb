#
# Cookbook Name:: powerline-chef-apiserver
# Recipe:: configure
#
# Configures the API server with the proper settings/configs
#
# Copyright (c) 2016 The Authors, All Rights Reserved.


include_recipe 'powerline-chef-apiserver::certs'
include_recipe 'powerline-chef-apiserver::webservices'
include_recipe 'powerline-chef-apiserver::rabbitmq'
