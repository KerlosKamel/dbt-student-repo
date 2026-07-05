{{
    config
    (
        materialized='view'
    )
}}

with src_hosts as
(
    SELECT * from {{ref('src_hosts')}}
)
SELECT
    host_id,
    -- case
    -- when host_name is null then 'Anonymous'
    -- else host_name 
    -- end AS host_name,
    -- nvl(host_name, 'Anonymous'),
    COALESCE(host_name, 'Anonymous') as host_name,
    is_superhost,
    created_at,
    updated_at
FROM
    src_hosts