#
# Cookbook Name:: mosql
# Recipe:: default
#
# Copyright 2013, Roadtrippers 
#
# Licensed under MIT; see LICENSE 
#

gem_package 'mosql'

Chef::Application.fatal!('node[\'mosql\'][\'collections_path\'] much be set') if node['mosql']['collections_path'].nil?
collections_path_flag = "-c #{node['mosql']['collections_path']}"
mosql_flag = node['mosql']['mongo'].nil? ? '' : "--mongo #{node['mosql']['mongo']}"
sql_flag = node['mosql']['sql'].nil? ? '' : "--sql #{node['mosql']['sql']}"
bash 'mosql' do
  code "mosql #{collections_path_flag} #{mosql_flag} #{sql_flag}"
end
