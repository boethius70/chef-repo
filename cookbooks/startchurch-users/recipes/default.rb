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
user1 = Chef::EncryptedDataBagItem.load("mddxusers", 'jantoniou',secret)
user_name = user1['name']
password  = user1['password']
ssh_key   = user1['ssh_key']
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

# MDDX user #2:  
user2 = Chef::EncryptedDataBagItem.load("mddxusers", 'nikola',secret)
user_name = user2['name']
password  = user2['password']
ssh_key   = user2['ssh_key']
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

# USER #3: 

user3 = Chef::EncryptedDataBagItem.load("mddxusers", 'jlorance',secret)
user_name = user3['name']
password  = user3['password']
ssh_key   = user3['ssh_key']
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

# ROOT USER #4:

user4 = Chef::EncryptedDataBagItem.load("mddxusers", 'root',secret)
user_name = user4['name']
password  = user4['password']
ssh_key   = user4['ssh_key']
home      = "/#{user_name}"

# Modify User [root]
user user_name do
  action :modify
  password password
  home  home
  shell "/bin/bash"
  supports :manage_home => true # Manage home directory
end

template "/etc/chef/mddx-databag.enc" do
  source "mddx-databag.erb"
  mode 0400
  owner "root"
  group "root"
end
