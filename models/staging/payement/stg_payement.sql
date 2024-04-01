WITH payement as (
select L_ORDERKEY as order_id,
L_EXTENDEDPRICE as price,
L_LINESTATUS as status,
from DBT_DATABASE.DBT_TABLE.PAYEMENT
)

select * from payement