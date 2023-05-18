-- models/bigquery_destination.sql

-- Destination table in BigQuery
{{ config(materialized='table',
          write_disposition='WRITE_APPEND',
          create_disposition='create_if_needed') }}

-- Query to transform and load data into BigQuery

with employees as (

    select
        emp_id as user_id,
        first_name,
        last_name,
        address,
        json_extract(address, '$.home') as home_address,
        json_extract(address, '$.home.street') as home_street,
        json_extract(address, '$.office.state') as office_state,
        mobile_no,
        email

    from `ds-labs-377209`.Testing_Airbyte.users

)



select * from employees