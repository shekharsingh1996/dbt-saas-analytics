with base_events as (
    select *
    from {{ ref('stg_events') }}
    where event_name in ('page_view', 'login', 'feature_used')
),

daily_activity as (
    select
        user_id,
        date(event_timestamp) as activity_date,
        count(*) as events_count
    from base_events
    group by user_id, activity_date
)

select *
from daily_activity
