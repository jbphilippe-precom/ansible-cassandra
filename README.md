Role Name
=========

This role install Cassandra v2.0.x or v2.1.x  v2.2.x & v3.0.x for Trusty
This role install Cassandra v3.0.x & v3.9.x for Xenial


Requirements
------------

- Ubuntu Trusty

Role Variables
--------------

     #
     # variables
     #
     cassandra_use_lvm: true
     cassandra_vg_name: vg_vroot
     cassandra_lv_name: lv_cassandra
     cassandra_lv_size: 10g
     cassiandra_datadir: /var/lib/cassandra

     cassandra_host_group: Cassandra_Cluster
     cassandra_version: 2.1
     cassandra_minor_version: latest
     cassandra_cluster_name: cluster_cassandra
     cassandra_interface: eth0
     cassandra_rpc_address: 0.0.0.0
     cassandra_row_cache_size_mb: 512
     cassandra_system_auth_replication_factor: 3
     cassandra_thrift_client_api_port: 9160
     cassandra_add_admin_user: True

     cassandra_conf_file: /etc/cassandra/cassandra.yaml
     cassandra_env_file: /etc/cassandra/cassandra-env.sh
     cassandra_logrotate_file: /etc/logrotate.d/cassandra


     Dans le ansible-vault
	(ansible-vault create xxxx.yml)
     	cassandra_admin_password: password_admin

Dependencies
------------


Example Playbook
----------------


     [Cassandra_CLuster]
     node1.network.local datacenter=DATACENTER
     node2.network.local datacenter=DATACENTER
     node3.network.local datacenter=DATACENTER


Playbook example:

     - name: deploy Cassandra
       hosts: Cassandra_Cluster
       remote_user: <your username>
       sudo: yes
       vars_files:
       - secret.yml
       vars:
         cassandra_cluster_name: Cluster1
         cassandra_host_group: Cassandra_Cluster

       roles:
         - ../roles/ansible-cassandra


Use Case
----------------

	# Installation
	export ANSIBLE_HOST_KEY_CHECKING=False; ansible-playbook -i hosts playbook.yml --ask-vault-pass --ask-pass --ask-become-pass --tags install

	# Test
	export ANSIBLE_HOST_KEY_CHECKING=False; ansible-playbook -i hosts playbook.yml --ask-vault-pass --ask-pass --ask-become-pass --tags testing

	# Rollback
	# On change la valeur de la variable : cassandra_minor_version de latest à 2.1.11 (exemple)
	export ANSIBLE_HOST_KEY_CHECKING=False; ansible-playbook -i hosts playbook.yml --ask-vault-pass --ask-pass --ask-become-pass --tags rollback



License
-------

BSD

Author Information
------------------

BSO ISL
