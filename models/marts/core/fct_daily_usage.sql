{{ config(
    materialized='incremental',
    unique_key='user_id || "_" || activity_date'
) }}

with source as (
    select *
    from {{ ref('int_daily_user_activity') }}
)

select *
from source
{% if is_incremental() %}
where activity_date > (select max(activity_date) from {{ this }})
{% endif %}
