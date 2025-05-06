select
  user_id,
  signup_date,
  country,
  plan
from {{ ref('stg_users') }}
