
{% for host in groups[cassandra_host_group] %}
{{ hostvars[host][cassandra_interface_prod]['ipv4']['address'] }}={{ hostvars[host].datacenter }}:01
{% endfor %}

default=DEF:RAC1
