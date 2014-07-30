#
# Author::  Jim Antoniou (jantoniou@gmail.com)
#
# Cookbook Name:: php
# Attribute:: nginx

case node['platform_family']
when 'rhel', 'fedora'
  default['php']['nginx_conf_dir'] = '/etc/nginx/conf.d'
when 'debian'
  default['php']['nginx_conf_dir'] = '/etc/nginx/conf.d'
else
  default['php']['nginx_conf_dir'] = '/etc/nginx/conf.d'
end
