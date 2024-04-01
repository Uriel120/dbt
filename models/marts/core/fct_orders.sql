with
    orders as (select * from {{ ref("stg_orders") }}),

    payement as (select * from {{ ref("stg_payement") }}),

    order_payments as (
        select order_id, sum(case when status = 'O' then price end) as amount

        from payement
        group by 1
    ),

    final as (

        select
            orders.order_id,
            orders.customer_id,
            orders.O_ORDERDATE,
            coalesce(order_payments.amount, 0) as amount

        from orders
        left join order_payments using (order_id)
    )

select *
from final
