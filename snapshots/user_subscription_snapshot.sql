{% snapshot user_subscription_snapshot %}
{{
    config(
      target_schema='analytics_dbt',
      unique_key='user_id',
      strategy='check',
      check_cols=['subscription_status']
    )
}}

select * from {{ ref('stg_subscriptions') }}

{% endsnapshot %}