
  create view "postgres"._airbyte_test_normalization."conflict_stream_scalar_ab3__dbt_tmp" as (
    
-- SQL model to build a hash column based on the values of this record
select
    md5(cast(coalesce(cast("id" as 
    varchar
), '') || '-' || coalesce(cast(conflict_stream_scalar as 
    varchar
), '') as 
    varchar
)) as _airbyte_conflict_stream_scalar_hashid,
    tmp.*
from "postgres"._airbyte_test_normalization."conflict_stream_scalar_ab2" tmp
-- conflict_stream_scalar
  );
