{% snapshot scd_raw_listings %}

{{
   config(
       target_database='AIRBNB',
       target_schema='DEV',
       unique_key='id',
       strategy='timestamp',
       updated_at='updated_at',
       invalidate_hard_deletes=True
   )
}}

SELECT * FROM {{ source('airbnb', 'listings') }}

{% endsnapshot %}