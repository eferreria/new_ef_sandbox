include: "*.view"

explore: order_summary {}

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

explore: new_inventory {
  view_name: inventory_items
  join: order_items {
    type: left_outer
    relationship: one_to_many
    sql: left join
          {% if order_items.id._in_query or order_items.shipped_date._in_query %} ${order_items.SQL_TABLE_NAME}
          {% else %}
          ${order_summary.SQL_TABLE_NAME} as order_items
            {% endif %}
            on order_items.inventory_item_id = inventory_items.id
          ;;
  }
}
