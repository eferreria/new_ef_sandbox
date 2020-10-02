view: order_summary {
  derived_table: {
    sql:
    select
        order_id,
        inventory_item_id,
        count(distinct id) order_item_ct
      from order_items
      group by 1,2
      order by 3 desc,1

       ;;

  }

  dimension: order_id {
    type: number
    sql: ${TABLE}.order_id ;;
  }

  dimension: inventory_item_id {
    type: number
    sql: ${TABLE}.order_item_id ;;
  }

  dimension: count {
    type: number
    sql: ${TABLE}.count ;;
  }

  dimension: field_test {
    type: string
    sql: {{order_summary._name}} ;;
  }



  set: detail {
    fields: [order_id, inventory_item_id]
  }
}

view: another_source {
  sql_table_name: order_items ;;
}
