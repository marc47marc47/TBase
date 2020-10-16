#!/bin/sh

echo '#!/bin/bash

pgxcInstallDir=/data/tbase/install
pgxcOwner=tbase
defaultDatabase=postgres
pgxcUser=$pgxcOwner
tmpDir=/tmp
localTmpDir=$tmpDir
configBackup=n
configBackupHost=pgxc-linker
configBackupDir=$HOME/pgxc
configBackupFile=pgxc_ctl.bak


#---- GTM ----------
gtmName=gtm
gtmMasterServer=127.0.0.1
gtmMasterPort=20158
gtmMasterDir=/data/tbase/data/158/gtm
gtmExtraConfig=none
gtmMasterSpecificExtraConfig=none
gtmSlave=y
gtmSlaveServer=127.0.0.1
gtmSlavePort=20159
gtmSlaveDir=/data/tbase/data/159/gtm
gtmSlaveSpecificExtraConfig=none

#---- Coordinators -------
coordMasterDirCn1=/data/tbase/data/158/coord
coordMasterDirCn2=/data/tbase/data/159/coord
coordArchLogDirCn1=/data/tbase/data/158/coord_archlog
coordArchLogDirCn2=/data/tbase/data/159/coord_archlog

coordNames=(cn001 cn002 )
coordPorts=(30158 30159 )
poolerPorts=(31158 31159 )
coordPgHbaEntries=(0.0.0.0/0)
coordMasterServers=(127.0.0.1 127.0.0.1)
coordMasterDirs=($coordMasterDirCn1 $coordMasterDirCn2)
coordMaxWALsernder=2
coordMaxWALSenders=($coordMaxWALsernder $coordMaxWALsernder )
coordSlave=n
coordSlaveSync=n
coordArchLogDirs=($coordArchLogDirCn1 $coordArchLogDirCn2)

coordExtraConfig=coordExtraConfig
cat > $coordExtraConfig <<EOF
#================================================
# Added to all the coordinator postgresql.conf
# Original: $coordExtraConfig

#include_if_exists = "/data/tbase/global/global_tbase.conf"

wal_level = replica
wal_keep_segments = 256 
max_wal_senders = 4
archive_mode = on 
archive_timeout = 1800 
#archive_command = "echo 0" 
log_truncate_on_rotation = on 
#log_filename = "postgresql-%M.log" 
log_rotation_age = 4h 
log_rotation_size = 20MB
hot_standby = on 
wal_sender_timeout = 30min 
wal_receiver_timeout = 30min 
shared_buffers = 128MB 
max_pool_size = 2000
#log_statement = "ddl"
#log_destination = "csvlog"
logging_collector = on
#log_directory = "pg_log"
#listen_addresses = "*"
max_connections = 2000

EOF

coordSpecificExtraConfig=(none none)
coordExtraPgHba=coordExtraPgHba
cat > $coordExtraPgHba <<EOF

local   all             all                                     trust
host    all             all             0.0.0.0/0               trust
host    replication     all             0.0.0.0/0               trust
host    all             all             ::1/128                 trust
host    replication     all             ::1/128                 trust


EOF


coordSpecificExtraPgHba=(none none)
coordAdditionalSlaves=n	
cad1_Sync=n

#---- Datanodes ---------------------
dn1MstrDir=/data/tbase/data/158/dn001
dn2MstrDir=/data/tbase/data/159/dn002
dn1SlvDir=/data/tbase/data/159/dn001
dn2SlvDir=/data/tbase/data/158/dn002
dn1ALDir=/data/tbase/data/158/datanode_archlog
dn2ALDir=/data/tbase/data/159/datanode_archlog

primaryDatanode=dn001
datanodeNames=(dn001 dn002)
datanodePorts=(40158 40159)
datanodePoolerPorts=(41158 41159)
datanodePgHbaEntries=(0.0.0.0/0)
datanodeMasterServers=(127.0.0.1 127.0.0.1)
datanodeMasterDirs=($dn1MstrDir $dn2MstrDir)
dnWALSndr=4
datanodeMaxWALSenders=($dnWALSndr $dnWALSndr)

datanodeSlave=y
datanodeSlaveServers=(127.0.0.1 127.0.0.1)
datanodeSlavePorts=(50159 50158)
datanodeSlavePoolerPorts=(51159 51158)
datanodeSlaveSync=n
datanodeSlaveDirs=($dn1SlvDir $dn2SlvDir)
datanodeArchLogDirs=($dn1ALDir/158/dn001 $dn2ALDir/159/dn002)

datanodeExtraConfig=datanodeExtraConfig
cat > $datanodeExtraConfig <<EOF
#================================================
# Added to all the coordinator postgresql.conf
# Original: $datanodeExtraConfig

#include_if_exists = "/data/tbase/global/global_tbase.conf"
#listen_addresses = "*" 
wal_level = replica 
wal_keep_segments = 256 
max_wal_senders = 4
archive_mode = on 
archive_timeout = 1800 
#archive_command = "echo 0" 
#log_directory = "pg_log" 
logging_collector = on 
log_truncate_on_rotation = on 
#log_filename = "postgresql-%M.log" 
log_rotation_age = 4h 
log_rotation_size = 50MB
hot_standby = on 
wal_sender_timeout = 30min 
wal_receiver_timeout = 30min 
shared_buffers = 128MB 
max_connections = 4000 
max_pool_size = 4000
#log_statement = "ddl"
#log_destination = "csvlog"
wal_buffers = 256MB
0
EOF

datanodeSpecificExtraConfig=(none none)
datanodeExtraPgHba=datanodeExtraPgHba
cat > $datanodeExtraPgHba <<EOF

local   all             all                                     trust
host    all             all             0.0.0.0/0               trust
host    replication     all             0.0.0.0/0               trust
host    all             all             ::1/128                 trust
host    replication     all             ::1/128                 trust


EOF


datanodeSpecificExtraPgHba=(none none)

datanodeAdditionalSlaves=n
walArchive=n
' > pgxc_ctl.conf
cp  -f pgxc_ctl.conf ~/pgxc_ctl/pgxc_ctl.conf
