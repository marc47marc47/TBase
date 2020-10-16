#!/bin/sh

cp -rf install ~/install
sed -i -e '/TBASE_HOME/d' ~/.bashrc
echo 'export TBASE_HOME=/home/tbase/install' >> ~/.bashrc
echo 'export PATH="$TBASE_HOME/bin:$PATH"' >> ~/.bashrc
echo 'export LD_LIBRARY_PATH=$TBASE_HOME/lib:$LD_LIBRARY_PATH' >> ~/.bashrc

mkdir -p pgxc_ctl
exit



# parare the data node
mkdir -p 158/gtm/pg_log
mkdir -p 159/gtm/pg_log

mkdir -p 158/coord/pg_log
mkdir -p 159/coord/pg_log

mkdir -p 158/dn001/pg_log
mkdir -p 159/dn001/pg_log

mkdir -p 158/dn002/pg_log
mkdir -p 159/dn002/pg_log

#prepare for pgxc


This build:
name		ip		port	folder
GTM master	127.0.0.1	30158	/data/tbase/data/158/gtm
GTM slave	127.0.0.1	30159	/data/tbase/data/159/gtm
CN1		127.0.0.1	40158	/data/tbase/data/158/coord
CN2		127.0.0.1	40159	/data/tbase/data/159/coord
DN1 master	127.0.0.1	50158	/data/tbase/data/158/dn001
DN1 slave	127.0.0.1	50159	/data/tbase/data/159/dn001
DN2 master	127.0.0.1	51159	/data/tbase/data/159/dn002
DN2 slave	127.0.0.1	51158	/data/tbase/data/158/dn002


Example:
节点名称	IP		数据目录
GTM master	10.215.147.158	/data/tbase/data/gtm
GTM slave	10.240.138.159	/data/tbase/data/gtm
CN1		10.215.147.158	/data/tbase/data/coord
CN2		10.240.138.159	/data/tbase/data/coord
DN1 master	10.215.147.158	/data/tbase/data/dn001
DN1 slave	10.240.138.159	/data/tbase/data/dn001
DN2 master	10.240.138.159	/data/tbase/data/dn002
DN2 slave	10.215.147.158	/data/tbase/data/dn002
