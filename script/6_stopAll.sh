#!/bin/sh


pgxc_ctl -c pgxc_ctl.conf stop all
exit $?


mkdir -p 158/gtm/pg_lg
pg_ctl -D 158/gtm -Z coordinator stop #30158

mkdir -p 158/coord/pg_lg
pg_ctl -D 158/coord -Z coordinator stop #30158

mkdir -p 159/coord/pg_lg
pg_ctl -D 159/coord -Z coordinator stop #30159

mkdir -p 158/dn001/pg_lg
pg_ctl -D 158/dn001 -Z datanode stop #40158

mkdir -p 159/dn001/pg_lg
pg_ctl -D 159/dn001 -Z datanode stop #40159

mkdir -p 158/dn002/pg_lg
pg_ctl -D 158/dn002 -Z datanode stop #50158

mkdir -p 159/dn002/pg_lg
pg_ctl -D 159/dn002 -Z datanode stop #50159

