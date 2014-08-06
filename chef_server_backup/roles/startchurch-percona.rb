name "startchurch-percona"
description "StartChurch Percona XtraDB Cluster"

run_list 'recipe[percona::cluster]'

default_attributes(
  "percona" => {
    "server" => {
      "role" => "cluster"
    },

    "cluster" => {
      "package"                     => "percona-xtradb-cluster-56",
      "wsrep_cluster_name"          => "percona_cluster_1",
      "wsrep_sst_receive_interface" => "eth0" # can be eth0, public, private, etc.
    }
  }
)
