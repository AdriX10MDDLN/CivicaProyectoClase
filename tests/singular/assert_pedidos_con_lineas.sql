select 
         o.order_id
        , o.user_id
        , o.address_id
        , o.promo_id
        , o.order_status
        , o.shipping_service
        , o.tracking_id
        , o.item_order_cost_usd
        , o.shipping_cost_usd
        , o.total_order_cost_usd
        , o.discount_usd
        , o.net_order_cost_usd
        , o.order_created_at_utc
        , o.estimated_delivery_at_utc
        , o.delivered_at_utc
        , o.days_to_deliver
        , o.date_load
        , oi.order_item_id
        , oi.order_id
        , oi.product_id
        , oi.quantity_units
        , oi.unit_price_usd
        , oi.line_total_usd
        , oi.date_load
    from {{ref('fct_orders')}} o 
    left join {{ref('fct_orders_items')}} oi on o.order_id = oi.order_id