#
# Author::  Jim Antoniou (jantoniou@gmail.com)
#
# Cookbook Name:: php
# Recipe:: nginx
#
# Delete any existing default configuration
file "#{node['php']['nginx_conf_dir']}/default.conf" do
  action :delete
end

template "#{node['php']['nginx_conf_dir']}/default.conf" do
        source 'default.conf.erb'
        owner 'root'
        group 'root'
        mode 00644
end

