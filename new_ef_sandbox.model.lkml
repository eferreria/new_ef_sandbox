connection: "thelook_events_redshift"

# include all the views
include: "*.view"

# include all the dashboards
include: "*.dashboard"

datagroup: new_eric_sandbox_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "4 hour"
}

persist_with: new_eric_sandbox_default_datagroup

explore: products {
  label: "Product Analysis"

  join: inventory_items {
    type: inner
    sql_on: ${products.id} = ${inventory_items.product_id};;
    relationship: one_to_many
  }
}

explore: inventory_items {
  join: products {
    type: left_outer
    sql_on: ${inventory_items.product_id} = ${products.id} ;;
    relationship: many_to_one
  }

  join: distribution_centers {
    type: left_outer
    fields: [distribution_centers.name]
    sql_on: ${products.distribution_center_id} = ${distribution_centers.id} ;;
    relationship: many_to_one
  }

}

explore: order_items {
  join: users {
    type: left_outer
    sql_on: ${order_items.user_id} = ${users.id} ;;
    relationship: many_to_one
  }

  join: inventory_items {
    type: left_outer
    sql_on: ${order_items.inventory_item_id} = ${inventory_items.id} ;;
    relationship: many_to_one
  }

  join: products {
    type: left_outer
    sql_on: ${inventory_items.product_id} = ${products.id} ;;
    relationship: many_to_one
  }

  join: distribution_centers {
    type: left_outer
    fields: [distribution_centers.name]
    sql_on: ${products.distribution_center_id} = ${distribution_centers.id} ;;
    relationship: many_to_one
  }

}



view: us_orders {
  extends: [order_items]
}

explore: us_orders {
  label: "US Orders in Current Year"
  always_filter: {
    filters: {
      field: users.country
      value: "USA"
    }
  }
  sql_always_where: ${created_year} = '2018' ;;

  join: users {
    type: left_outer
    sql_on: ${us_orders.user_id} = ${users.id} ;;
    relationship: many_to_one
  }

  join: inventory_items {
    type: left_outer
    sql_on: ${us_orders.inventory_item_id} = ${inventory_items.id} ;;
    relationship: many_to_one
  }

  join: products {
    type: left_outer
    sql_on: ${inventory_items.product_id} = ${products.id} ;;
    relationship: many_to_one
  }

  join: distribution_centers {
    type: left_outer
    fields: [distribution_centers.name]
    sql_on: ${products.distribution_center_id} = ${distribution_centers.id} ;;
    relationship: many_to_one
  }
}
view: t {derived_table:{sql:select null;;}}
explore: km_test {
  view_name: t
  join: order_summary {
    type: left_outer
    relationship: one_to_one
    sql:  left join
    {% if order_summary.order_item_id._in_query %}
${order_summary.SQL_TABLE_NAME}   as order_summary
    {% else %}
${another_source.SQL_TABLE_NAME}    as order_summary
    {% endif %}
    on order_summary.order_item_id=t.SOMETHING_ELSE__HAHA
    ;;
#     sql_table_name: ${another_source.SQL_TABLE_NAME} ;;
  }

}
