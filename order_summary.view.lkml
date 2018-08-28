explore: order_summary {}

view: order_summary {
  derived_table: {
    sql:
    {% if order_summary.order_item_id._in_query %}
      select order_id, id as order_item_id, 1 from order_items
    {% else %}
      select
        order_id,
        created_at,
        count(distinct id) order_item_ct
      from order_items
      group by 1,2
      order by 3 desc,1
    {% endif %}

       ;;

  }

  dimension: order_id {
    type: number
    sql: ${TABLE}.order_id ;;
  }

  dimension: order_item_id {
    type: number
    sql: ${TABLE}.order_item_id ;;
  }

  dimension: count {
    type: number
    sql: ${TABLE}.count ;;
  }

  set: detail {
    fields: [order_id, count]
  }
}
