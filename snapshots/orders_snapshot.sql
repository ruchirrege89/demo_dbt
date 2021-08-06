{% snapshot orders_snapshot %}

{{
    config(
      target_database='analytics',
      target_schema='snapshots',
      unique_key='id',

      strategy='check',
      check_cols=['status'],
      updated_at='_ETL_LOADED_AT',
      invalidate_hard_deletes=True,
    )
}}

select * from {{ source('jaffle_shop', 'orders') }}

{% endsnapshot %}