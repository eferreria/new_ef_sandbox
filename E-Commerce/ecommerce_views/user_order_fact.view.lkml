view: user_order_fact {
  derived_table: {
    sql: select
        oi.user_id
        , oi.order_id
        , oi.created_at
        , rank() over (partition by user_id order by created_at) as order_sequence
        , count( order_id) over (partition by user_id) as total_lifetime_orders
      from order_items oi
      group by 1,2,3
      order by 1,2
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: user_id {
    type: number
    sql: ${TABLE}.user_id ;;
  }

  dimension: order_id {
    type: number
    sql: ${TABLE}.order_id ;;
  }

  dimension_group: created_at {
    type: time
    sql: ${TABLE}.created_at ;;
  }

  dimension: order_sequence {
    type: number
    sql: ${TABLE}.order_sequence ;;
  }

  dimension: total_lifetime_orders {
    type: number
    sql:  ${TABLE}.total_lifetime_orders ;;
  }

  dimension: is_first_purchase {
    type: yesno
    sql: ${order_sequence}=1 ;;
  }

  dimension: has_subsequent_order {
    type: yesno
    sql: ${total_lifetime_orders}>1 ;;
  }

  dimension: days_between_order {
    type: number
    sql:  datediff(days, ${created_at_date}, ${next_order.created_at_date}) ;;
  }

  set: detail {
    fields: [user_id, order_id, created_at_time, order_sequence]
  }
}
