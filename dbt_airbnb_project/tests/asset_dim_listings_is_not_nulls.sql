-- using custom macro, macros/no_nulls_in_columns.sql
{{ no_nulls_in_columns(ref('dim_listings_cleansed')) }}