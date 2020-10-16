create default node group default_group  with (dn001,dn002);
create sharding group to group default_group;
create database testdb;
alter user user01 with password 'user01';
alter database testdb owner to user01;
