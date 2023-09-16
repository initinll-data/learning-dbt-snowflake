WITH raw_hosts AS (
    SELECT * FROM AIRBNB.RAW.RAW_HOSTS
)

SELECT 
    ID AS host_id, 
    NAME AS host_name, 
    IS_SUPERHOST, 
    CREATED_AT, 
    UPDATED_AT
FROM raw_hosts