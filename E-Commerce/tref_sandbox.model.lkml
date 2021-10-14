connection: "thelook_events_redshift"

# include all the views
include: "./ecommerce_views/*.view"
include: "./dashboards/*.dashboard"
include: "./code_tests/*.view"

datagroup: new_eric_sandbox_default_datagroup {
  max_cache_age: "8 hour"
}

persist_with: new_eric_sandbox_default_datagroup

label: "tREF Sandbox"

map_layer: gender_map_layer {
  file: "./map/gender_map.topojson"
}

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
  query: brand_summary {
    dimensions: [products.brand]
    measures: [order_items.total_orders, order_items.total_customers]
  }

  query: user_geo_summary {
    label: "Total US Customers by City, State"
    description: "Use this starting point query to view total customers and orders in each US City and State"
    dimensions: [users.state, users.city]
    measures: [order_items.total_orders, users.count]
  }

  always_filter: {
    filters: [users.country: ""]
  }

  access_filter: {
    field: products.brand
    user_attribute: brand
  }

  fields: [ALL_FIELDS*, -next_order.next_order_exclusions*]
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

# {
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
# }

explore: users {
  fields: [ALL_FIELDS*, -order_items.exclude_inventory_item_fields*]

  join: order_items {
    sql_on: ${order_items.user_id}=${users.id};;
    relationship: many_to_one
  }
  join: inventory_items {
    fields: []
    sql_on: ${order_items.inventory_item_id}=${inventory_items.id};;
    relationship: many_to_one
  }
  # join: user_order_ltd {
  #   sql_on: ${user_order_ltd.user_id}=${users.id} ;;
  #   relationship: one_to_one
  # }
}

explore: custom_map {
  from: users
  fields: [custom_map.region_selector, custom_map.city, custom_map.state,
    custom_map.region_selector_filter, custom_map.zip, custom_map.region_selector_color,
    custom_map.market_region, custom_map.county, custom_map.county_fips, custom_map.exposed_fields*
    , hospital_locations.all_hosp_loc*
    ]

  join: hospital_locations {
    sql_on:  ${custom_map.zip} = ${hospital_locations.zip};;
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

explore: user_order_fact {
  fields: [ALL_FIELDS*, -next_order.created_at_date]
  join: next_order {
    from: user_order_fact
    sql_on: ${next_order.user_id}=${user_order_fact.user_id}
      and ${user_order_fact.order_sequence}=${next_order.order_sequence}-1 ;;
    relationship: one_to_one
    fields: [next_order.created_at_date, next_order.order_id]
  }
}


explore: geo_user_summary {}
