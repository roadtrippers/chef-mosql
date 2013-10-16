#
# Cookbook Name:: mosql
# Recipe:: default
#
# Copyright 2013, Roadtrippers 
#
# Licensed under MIT; see LICENSE 
#

require 'yaml'

# temporarily install gem from rt fork
git '/usr/local/src/mosql' do
  repository 'https://github.com/roadtrippers/mosql.git'
end

execute 'gem build mosql.gemspec' do
  cwd '/usr/local/src/mosql'
end

gem_package 'mosql' do
  source '/usr/local/src/mosql/mosql-0.2.0.gem'
end

directory File.dirname( node[:mosql][:collections_path] ) do
  action :create
end

template "#{node[:mosql][:collections_path]}" do
  source 'collections.yml.erb'
  owner 'root'
  group 'root'
  mode '0755'
  variables database: node[:mosql][:mongo_database], collections: node[:mosql][:collections] 
end

# TODO: use runnit to start service
# directory File.dirname( node[:mosql][:log_path] ) do
#   action :create
# end
# 
# file node[:mosql][:log_path] do
#   action :create_if_missing
# end
# 
# collection_flag = "-c #{node['mosql']['collections_path']}"
# mosql_flag = node['mosql']['mongo'].nil? ? '' : "--mongo #{node['mosql']['mongo']}"
# sql_flag = node['mosql']['sql'].nil? ? '' : "--sql #{node['mosql']['sql']}"
# service 'mosql' do
#   start_command "mosql #{collection_flag} #{mosql_flag} #{sql_flag}" 
#   action [:enable, :start]
# end
