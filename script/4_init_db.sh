#!/bin/sh


cd ~/pgxc_ctl

pgxc_ctl <<_EOF
deplay all
_EOF

pgxc_ctl <<_EOF
init all
_EOF

psql -U tbase -d postgres -f initdb.sql
