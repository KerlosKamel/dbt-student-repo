{{
    config
    (
        materialized='view'
    )
}}

WITH src_listings AS
(
    SELECT * FROM {{ref('src_listings')}}
)
SELECT
    listing_id,
    listing_name,
    room_type,
    case 
    when minimum_nights = 0 then 1 
    else minimum_nights 
    end as minimum_nights,
    host_id,
    replace(price_str, '$') :: number(10, 2) as price,
    created_at,
    updated_at
FROM
    src_listings    