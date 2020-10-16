#!/bin/sh

pgxc_ctl -c pgxc_ctl.conf start all
exit $?

pg_ctl -D 158/coord -Z coordinator start #30158
psql -l -p 30158

pg_ctl -D 159/coord -Z coordinator start #30159
psql -l -p 30159

pg_ctl -D 158/dn001 -Z datanode start #40158
psql -l -p 40158

pg_ctl -D 159/dn001 -Z datanode start #40159
psql -l -p 40159

pg_ctl -D 158/dn002 -Z datanode start #50158
psql -l -p 50158

pg_ctl -D 159/dn002 -Z datanode start #50159
psql -l -p 50159

