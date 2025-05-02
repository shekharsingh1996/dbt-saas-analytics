-- models/staging/stg_users.sql

select
  user_id,
  signup_date,
  country,
  org_id,
  plan,
  device_type
from `saas-analytics-458601.analytics_dbt.users`
