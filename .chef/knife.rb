log_level                :debug
log_location             STDOUT
node_name                'jantoniou'
client_key               '/home/jantoniou/chef/.chef/jantoniou-chef.startchurch.com.pem'
validation_client_name   'chef-validator'
validation_key           '/home/jantoniou/chef/.chef/client.pem'
chef_server_url          'https://chef.startchurch.com'
syntax_check_cache_path  '/home/jantoniou/chef/.chef/syntax_check_cache'
cookbook_path		 '/home/jantoniou/chef/cookbooks'
knife[:digital_ocean_client_id] = 'DmxifjGjXE1rxLQXEiEQ8A'
knife[:digital_ocean_api_key]   = 'baf023e6b11815a1944eeb6053474e5e'
