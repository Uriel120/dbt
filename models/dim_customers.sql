WITH customer as(

select
    C_CUSTKEY as customer_id,
    C_NAME,
    C_PHONE

from dbt_database.dbt_table.customer

),
orders as (

select
    O_ORDERKEY as order_id,
    O_CUSTKEY as customer_id,
    O_ORDERDATE,
    O_ORDERSTATUS

from dbt_database.dbt_table.orders

),

customer_orders as (

    select
        customer_id,

        min(O_ORDERDATE) as first_order_date,
        max(O_ORDERDATE) as most_recent_order_date,
        count(order_id) as number_of_orders

    from orders

    group by 1

),

final as (

    select
        customer.customer_id,
        customer.C_NAME,
        customer_orders.first_order_date,
        customer_orders.most_recent_order_date,
        coalesce(customer_orders.number_of_orders, 0) as number_of_orders

    from customer

    left join customer_orders using (customer_id)
    )

select * from final 