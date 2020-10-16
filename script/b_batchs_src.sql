create table b_batchs_src
  (
    batch_id varchar(32) not null ,
    batch_ver integer not null ,
    inter_ver integer not null ,
    org_code varchar(8) not null ,
    resource_type integer,
    status integer,
    src_url varchar(254),
    update_date timestamp(6) without time zone,
    app_code varchar(16),
    is_migrate varchar(1),
    is_push varchar(1),
    update_date_str varchar(20)
    --,primary key (batch_id,org_code,batch_ver)
  ) ;

--revoke all on b_batchs_src from "public" as


create index src_update_date on b_batchs_src (update_date) ;
