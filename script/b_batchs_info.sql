create table b_batchs_info
  (
    batch_id varchar(32) not null ,
    batch_ver integer not null ,
    inter_ver integer,
    busi_no varchar(32),
    app_code varchar(16),
    status integer,
    create_user varchar(16),
    create_date timestamp(6) without time zone,
    mod_user varchar(16),
    mod_date timestamp(6) without time zone,
    biz_org varchar(10)
    --,primary key (batch_id,batch_ver)
  );

--revoke all on b_batchs_info from "public" as


create index i_app_code on b_batchs_info (busi_no, app_code,batch_id) ;

