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
  port "9000"
  socket true
  socket_path '/tmp/phpmyadmin.sock'
  socket_perms "0666"
  start_servers 2
  min_spare_servers 2
  max_spare_servers 8
  max_children 8
  terminate_timeout (node['php']['ini_settings']['max_execution_time'].to_i + 20)
  value_overrides({
    :error_log => "#{node['php']['fpm_log_dir']}/nginx-php.log"
  })
end
