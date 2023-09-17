{{
  config(materialized = 'incremental', on_schema_change = 'fail')
}}

WITH src_reviews AS (
    SELECT * FROM {{ ref('src_reviews') }}
)
-- using dbt_utils package macro, package.yml, package: dbt-labs/dbt_utils
SELECT  
  {{ dbt_utils.generate_surrogate_key(['listing_id', 'review_date', 'reviewer_name', 'review_text']) }} as review_id,
  * 
FROM src_reviews
WHERE review_text IS NOT NULL
{% if is_incremental() %}
  AND (review_date >= (select max(review_date) from {{ this }}))
{% endif %}