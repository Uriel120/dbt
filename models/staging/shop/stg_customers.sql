WITH customer as(

select
    C_CUSTKEY as customer_id,
    C_NAME,
    C_PHONE

from dbt_database.dbt_table.customer

)

select * from customer