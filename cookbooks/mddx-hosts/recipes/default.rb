#
# Cookbook Name:: mddx-hosts
# Recipe:: default
#
# Copyright 2013, MDDX, Inc.
#
# Created by Jim Antoniou (jantoniou@gmail.com)
# 
# All rights reserved - Do Not Redistribute
hostsfile_entry '166.78.4.15' do
  hostname 'ecra-chef1-dfw-prod.mddx.com'
  action :create
end

directory "/www" do
  owner "root"
  group "root"
  mode 0755
  action :create
end

nfs_export "/www" do
  network '10.0.0.0/8'
  writeable true
  sync true
  options ['no_root_squash']
end
