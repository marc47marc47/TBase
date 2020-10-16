source tbase.env
psql -f b_batchs_metadata.sql
psql -f b_batchs_info.sql
psql -f b_batchs_src.sql
