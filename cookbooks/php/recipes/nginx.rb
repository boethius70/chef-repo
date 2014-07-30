#
# Author::  Jim Antoniou (jantoniou@gmail.com)
#
# Cookbook Name:: php
# Recipe:: nginx
#

#include_recipe 'nginx'

template "#{node['php']['nginx_conf_dir']}/php.ini" do
        source 'default.conf.erb'
        owner 'root'
        group 'root'
        mode 00644
        only_if { platform_family?('debian','rhel') }
end

