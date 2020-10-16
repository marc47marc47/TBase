create table b_batchs_metadata
  (
    batch_id varchar(32) not null ,
    app_code varchar(16) not null ,
    prop_code varchar(32) not null ,
    prop_value varchar(128) not null ,
    create_time timestamp(6) without time zone
    --,primary key (batch_id,prop_code)
  )
distribute by shard(batch_id)
to group default_group
;

create index b_batchs_metadata_idx2 on b_batchs_metadata (prop_code,prop_value) ;
