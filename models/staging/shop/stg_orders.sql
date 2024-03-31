WITH orders as (

select
    O_ORDERKEY as order_id,
    O_CUSTKEY as customer_id,
    O_ORDERDATE,
    O_ORDERSTATUS

from dbt_database.dbt_table.orders
)

select * from orders