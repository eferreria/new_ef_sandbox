# If necessary, uncomment the line below to include explore_source.
# include: "new_ef_sandbox.model.lkml"


view: user_order_ltd {
  label: "User Lifetime Orders"
  derived_table: {
    explore_source: order_items {
      column: total_orders {}
      column: total_gross_revenue {}
      column: total_sales {}
      column: min_order_date {}
      column: max_order_date {}
      column: user_id {}
    }
# sql: SELECT
#   order_items.user_id  AS user_id,
#   COUNT(DISTINCT order_items.order_id ) AS total_orders,
#   COALESCE(SUM(CASE WHEN NOT COALESCE(order_items.status in ('Cancelled', 'Returned'), FALSE) THEN order_items.sale_price  ELSE NULL END), 0) AS total_gross_revenue,
#   COALESCE(SUM(order_items.sale_price ), 0) AS total_sales,
#   min(trunc(order_items.created_at)) AS min_order_date,
#   max(trunc(order_items.created_at)) AS max_order_date
# FROM public.order_items  AS order_items
#
# GROUP BY 1 ;;
  }
  dimension: total_orders {
    type: number
    sql: nullif(${TABLE}.total_orders,0) ;;
  }
  dimension: total_gross_revenue {
    description: "Titak revenue from completed sales (cancelled and returned orders excluded)"
    value_format: "$ #,##0.00"
    type: number
  }
  dimension: total_sales {
    label: "Order Items Total Sale Price"
    description: "Total sales from items sold"
    value_format: "$ #,##0.00"
    type: number
  }
  dimension: min_order_date {
    label: "Order Items First Order Date"
    type: date
    convert_tz: no
  }
  dimension: max_order_date {
    label: "Order Items Last Order Date"
    type: date
    convert_tz: no
  }
  dimension: user_id {
    type: number
  }

  dimension: cust_ltd_order_tier {
    label: "Customer Lifetime Orders"
    type: tier
    tiers: [1,2,3,6,10]
    sql: ${total_orders} ;;
    style: integer
  }

  dimension: cust_ltd_revenue {
    label: "Customer Lifetime Revenue"
    type: tier
    tiers: [5, 20, 50, 100, 500, 1000]
    sql: nullif(${total_gross_revenue},0) ;;
    style: relational
  }

  dimension: days_since_last_order {
    type: number
    sql: datediff(days, nullif(${max_order_date},current_date), current_date) ;;
  }

  dimension: is_active {
    description: "Customer has purchased from the website within the last 90 days"
    type: yesno
    sql: ${days_since_last_order}<=90 ;;
  }

  dimension: repeat_customer {
    type: yesno
    sql: ${total_orders}>1 ;;
  }

  measure: total_ltd_ord {
    label: "Total Lifetime Orders"
    type: sum
    sql: ${total_orders} ;;
  }

  measure: avg_ltd_orders {
    label: "Average Lifetime Orders"
    type: average
    sql: ${total_orders} ;;
  }
  measure: total_lifetime_revenue {
    type: sum
    sql: ${total_gross_revenue} ;;
    value_format: "$ #,##0.00"
  }
  measure: average_lifetime_revenue {
    type: average
    sql: ${total_gross_revenue} ;;
    value_format: "$ #,##0.00"
  }
  measure: average_days_since_latest_order {
    type: average
    sql: ${days_since_last_order} ;;
  }
  measure: count {
    type: count
  }
}
