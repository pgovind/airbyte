

  create or replace view `dataline-integration-testing`._airbyte_test_normalization.`conflict_stream_name_conflict_stream_name_ab3`
  OPTIONS()
  as 
-- SQL model to build a hash column based on the values of this record
select
    to_hex(md5(cast(concat(coalesce(cast(_airbyte_conflict_stream_name_hashid as 
    string
), ''), '-', coalesce(cast(conflict_stream_name as 
    string
), '')) as 
    string
))) as _airbyte_conflict_stream_name_2_hashid,
    tmp.*
from `dataline-integration-testing`._airbyte_test_normalization.`conflict_stream_name_conflict_stream_name_ab2` tmp
-- conflict_stream_name at conflict_stream_name/conflict_stream_name;

