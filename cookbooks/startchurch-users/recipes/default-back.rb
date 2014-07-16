#
# Cookbook Name:: mddx-users
# Recipe:: default
#
# Copyright 2013, MDDX, Inc.
#
# All rights reserved - Do Not Redistribute
#
# Load databag encryption key first

# Put the Databag Encryption secret in /etc/chef:

secret = Chef::EncryptedDataBagItem.load_secret("/etc/chef/mddx-databag.enc")
user = Chef::EncryptedDataBagItem.load("mddxusers", 'jantoniou',secret)
user_name = user['name']
password  = user['password']
ssh_key   = user['ssh_key']
home      = "/home/#{user_name}"

# Create a User [deploy]
user user_name do
  password password
  home  home
  shell "/bin/bash"
  supports :manage_home => true # Manage home directory
end

# Add [deploy] to [wheel]group
group "wheel" do
  members [user_name]
  append true
end

template "/etc/chef/mddx-databag.enc" do
  source "mddx-databag.erb"
  mode 0400
  owner "root"
  group "root"
end

# Create .ssh directory
directory "#{home}/.ssh" do
  owner user_name
  group user_name
end

# create an authorized_keys file
authorized_keys_file ="#{home}/.ssh/authorized_keys"
file authorized_keys_file do
  owner user_name
  mode  0600
  content "#{ssh_key} #{user_name}"
  not_if { ::File.exists?("#{authorized_keys_file}")}
end
