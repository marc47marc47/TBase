#!/bin/sh


pgxc_ctl <<_EOF
monitor all
_EOF


psql -c "select * from pgxc_node;" -U tbase -d postgres
