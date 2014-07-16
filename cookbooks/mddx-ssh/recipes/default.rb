#
# Cookbook Name:: mddx-ssh
# Recipe:: default
#
# Copyright 2013, MDDX, Inc
#
# All rights reserved - Do Not Redistribute
#

packages = case node[:platform]
  when "centos","redhat","fedora"
    %w{openssh-clients openssh}
  else
    %w{openssh-client openssh-server}
  end
  
packages.each do |pkg|
  package pkg
end

template "/etc/ssh/sshd_config" do
  source "sshd_config.erb"
  owner "root"
  group "root"
  mode 0600
  notifies :restart, "service[ssh]"
end

service "ssh" do
  case node[:platform]
  when "centos","redhat","fedora"
    service_name "sshd"
  else
    service_name "ssh"
  end
  action [:enable, :start]
  supports :restart => true, :reload => true
end
