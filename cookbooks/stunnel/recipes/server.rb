directory '/etc/stunnel/'

execute "Create stunnel SSL Certificates" do
  command "openssl req -subj \"#{node[:stunnel][:server_ssl_req]}\" -new -nodes -x509 -out /etc/stunnel/stunnel.pem -keyout /etc/stunnel/stunnel.pem"
  creates '/etc/stunnel/stunnel.pem'
end

include_recipe 'stunnel'
