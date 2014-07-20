#
# Cookbook Name:: startchurch-users
# Recipe:: default
#
# Copyright 2014, StartChurch, Inc.
#
# All rights reserved - Do Not Redistribute
#
user_account 'jantoniou' do
    ssh_keygen true
end

node.default['users'] = ['jantoniou']
