
  create or replace  view "AIRBYTE_DATABASE"._AIRBYTE_TEST_NORMALIZATION_NAMESPACE."SIMPLE_STREAM_WITH_NAMESPACE_RESULTING_INTO_LONG_NAMES_AB3"  as (
    
-- SQL model to build a hash column based on the values of this record
select
    md5(cast(coalesce(cast(ID as 
    varchar
), '') || '-' || coalesce(cast(DATE as 
    varchar
), '') as 
    varchar
)) as _AIRBYTE_SIMPLE_STREAM_WITH_NAMESPACE_RESULTING_INTO_LONG_NAMES_HASHID,
    tmp.*
from "AIRBYTE_DATABASE"._AIRBYTE_TEST_NORMALIZATION_NAMESPACE."SIMPLE_STREAM_WITH_NAMESPACE_RESULTING_INTO_LONG_NAMES_AB2" tmp
-- SIMPLE_STREAM_WITH_NAMESPACE_RESULTING_INTO_LONG_NAMES
  );
