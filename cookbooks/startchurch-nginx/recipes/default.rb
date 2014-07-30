#
# Cookbook Name:: startchurch-nginx
# Recipe:: default
#
# Copyright 2014, Startchurch, Inc.
#
# All rights reserved - Do Not Redistribute
#
php_fpm 'nginx' do
  action :add
  user 'nginx'
  group 'nginx'
  ip_address "127.0.0.1"
  port 9000
  socket false
  start_servers 4
  min_spare_servers 4 
  max_spare_servers 12
  max_children 20 
  terminate_timeout (node['php']['ini_settings']['max_execution_time'].to_i + 20)
  value_overrides({
    :error_log => "#{node['php']['fpm_log_dir']}/nginx-php.log"
  })
end
