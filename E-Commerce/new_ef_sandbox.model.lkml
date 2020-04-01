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

label: "tREF Sandbox"

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
  fields: [ALL_FIELDS*, -next_order.created_at_date]
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

  join: user_order_fact {
    type: left_outer
    sql_on: ${user_order_fact.order_id}=${order_items.order_id} ;;
    relationship: many_to_one
  }

  join: next_order {
    from: user_order_fact
    sql_on: ${next_order.user_id}=${user_order_fact.user_id}
      and ${user_order_fact.order_sequence}=${next_order.order_sequence}-1 ;;
    relationship: one_to_one
    fields: [next_order.created_at_date, next_order.order_id]
  }

}


# view: t {derived_table:{sql:select null;;}}
# explore: km_test {
#   view_name: t
#   join: order_summary {
#     type: left_outer
#     relationship: one_to_one
#     sql:  left join
#     {% if order_summary.order_item_id._in_query %}
# ${order_summary.SQL_TABLE_NAME}   as order_summary
#     {% else %}
# ${another_source.SQL_TABLE_NAME}    as order_summary
#     {% endif %}
#     on order_summary.order_item_id=t.SOMETHING_ELSE__HAHA
#     ;;
# #     sql_table_name: ${another_source.SQL_TABLE_NAME} ;;
#   }
# }

explore: users {
#   join: order_items {
#     sql_on: ${order_items.user_id}=${users.id};;
#     relationship: many_to_one
#   }
#   join: inventory_items {
#     sql_on: ${order_items.inventory_item_id}=${inventory_items.id};;
#     relationship: many_to_one
#   }
#   join: user_order_ltd {
#     sql_on: ${user_order_ltd.user_id}=${users.id} ;;
#     relationship: one_to_one
#   }
  join: user_state_summary {
    sql_on: ${user_state_summary.selected_dimension} =

{% if users.user_selected_dimension._parameter_value == 'city' %}
      ${users.city}
    {% elsif users.user_selected_dimension._parameter_value == 'state' %}
      ${users.state}
    {% else %}
      ${users.country}
    {% endif %}

    ;;
    relationship: many_to_one

  }
}

explore: cohort_orders_example {
  hidden: yes
  label: "Cohort Example"
  from: order_items
#   fields: [ALL_FIELDS*]
  view_name: cohort_orders_example
  view_label: "Order Items"
  join: users {
    type: left_outer
    sql_on: ${cohort_orders_example.user_id} = ${users.id} ;;
    relationship: many_to_one

  }

  join: inventory_items {
    type: left_outer
    sql_on: ${cohort_orders_example.inventory_item_id} = ${inventory_items.id} ;;
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

  join: test_cohort {
    view_label: "XX - Cohort Selections"
    type: inner
    sql_on: ${users.id} = ${test_cohort.user_id} ;;
    relationship: many_to_one
  }
}

explore: test {
  hidden: yes
}
