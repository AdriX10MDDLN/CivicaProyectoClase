with tmpOrders as (
    select * from {{ ref('slv_sql_server_dbo__orders') }}
), tmpAddresses as(
    select * from {{ ref('slv_sql_server_dbo__addresses') }}
), tmpPromos as(
    select * from {{ ref('slv_sql_server_dbo__promos') }}
) select
         p.discount_usd
        , p.promo_status
        , a.address_line
        , a.zipcode
        , a.state
        , a.country
        , o.order_id
        , o.user_id
        , o.address_id
        , o.promo_id
        , o.created_at_utc
        , o.delivered_at_utc
        , o.estimated_delivery_at_utc
        , o.tracking_id
        , o.shipping_service
        , o.shipping_cost
        , o.order_cost
        , o.total_order_cost_usd
        , o.order_status
        , o.is_deleted
        , o.date_load
        , o.loaded_at_utc
    from tmpOrders o
    left join tmpPromos p on o.promo_id = p.promo_id
    left join tmpAddresses a on a.address_id = o.address_id
