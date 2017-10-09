#!/bin/bash
# -----------------------------------------------------------------------------
# Auteur           : CUZA F
# Date de création : 12.11.15
# Objet            : Maintenance Cassandra
# -----------------------------------------------------------------------------
logfile="/var/log/cassandra/add_node.log"

echo "########################################" >> $logfile
echo "$(date) Cassandra cluster cleanup started." >> $logfile
echo "----------------------------------------" >> $logfile

for node in $(nodetool status | grep 'UN' | awk '{ print $2 }' | sort); do
    echo "$(date) [$node] Cassandra cleanup started." >> $logfile
    nodetool -h $node cleanup
    echo "$(date) [$node] Cassandra cleanup completed." >> $logfile
done
