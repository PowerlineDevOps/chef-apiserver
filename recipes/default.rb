#
# Cookbook Name:: powerline-chef-apiserver
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

include_recipe 'powerline-chef-baseline::default'

include_recipe 'powerline-chef-apiserver::php5'
include_recipe 'powerline-chef-apiserver::python'
include_recipe 'powerline-chef-apiserver::webservices'
include_recipe 'powerline-chef-apiserver::supervisor'
include_recipe 'powerline-chef-apiserver::rabbitmq'

